//
//  ImagePaginationManagerTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import XCTest
import Combine
@testable import MyCar

final class ImagePaginationManagerTests: XCTestCase {
    private var sut: ImagePagingViewModel!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        sut = ImagePagingViewModel(images: ["", "", "", ""],
                                      pagesCount: 3,
                                      currentIndexSubject: CurrentValueSubject(0))
        cancellables = []
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        cancellables = nil
    }

    func testShowLeftIcon_() throws {
        var expectation = XCTestExpectation(description: "Show left icon")

        var shouldShow = true
        sut.$shouldShowLeftIcon.sink { show in
            shouldShow = show
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.currentIndexSubject.send(1)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertFalse(shouldShow)
        
        expectation = XCTestExpectation(description: "Show left icon")
        shouldShow = false
        sut.currentIndexSubject.send(3)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(shouldShow)
    }
    
    func testShowRightIcon() throws {
        var expectation = XCTestExpectation(description: "Show left icon")

        var shouldShow = false
        sut.$shouldShowRightIcon
            .dropFirst(1)
            .sink { show in
            shouldShow = show
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.currentIndexSubject.send(2)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(shouldShow)
        
        expectation = XCTestExpectation(description: "Show left icon")
        shouldShow = true
        sut.currentIndexSubject.send(3)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertFalse(shouldShow)
    }
    
    func testValidateTransition_whenMovedLeft_OnFirstPage() throws {
        let validatedTranslation = sut.validTranslation(translationX: 100)
        
        XCTAssertEqual(validatedTranslation, 0)
    }
    
    func testValidateTransition_whenMovedLeft_OnSecondPage() throws {
        let sut: ImagePagingViewModel! = ImagePagingViewModel(images: ["", ""],
                                                                                  pagesCount: 1,
                                                                                  currentIndexSubject: CurrentValueSubject(1))
        let translation: CGFloat = 100
        
        let validatedTranslation = sut.validTranslation(translationX: translation)
        
        XCTAssertEqual(validatedTranslation, translation)
    }

    func testValidateTransition_whenMovedRight_OnFirstPage() throws {
        let translation: CGFloat = -100

        let validatedTranslation = sut.validTranslation(translationX: -100)
        
        XCTAssertEqual(translation, validatedTranslation)
    }
    
    func testValidateTransition_whenMovedLeft_OnLastPage() throws {
        let sut: ImagePagingViewModel! = ImagePagingViewModel(images: ["", ""],
                                                                                  pagesCount: 1,
                                                                                  currentIndexSubject: CurrentValueSubject(1))
        
        let validatedTranslation = sut.validTranslation(translationX: -100)
        
        XCTAssertEqual(validatedTranslation, 0)
    }
    
    func testTranslationHandle() {
        var expectation = XCTestExpectation(description: "Test tranlation handler")

        var newIndex = 0
        sut.$selectedIndex
            .sink { index in
                newIndex = index
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.handleGesture(translationX: -200, geometryWidth: 100)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(newIndex, 2)
    }

}
