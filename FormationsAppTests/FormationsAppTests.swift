//
//  FormationsAppTests.swift
//  FormationsAppTests
//
//  Created by Angelique Babin on 23/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import XCTest
import CoreXLSX
@testable import FormationsApp

final class FormationsAppTests: XCTestCase {
    
    // MARK: - Tests parseFile - FileStudiesService
    
    func testParseFileOfFileStudiesServiceShouldResultFailedCallbackIfNoErrorAndCorrectData() {
        // Given
        let fileStudiesService = FileStudiesService()
        var allStudiesList = [Studies]()
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        guard let path = Bundle.main.path(forResource: "studies", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }
        do {
            try fileStudiesService.parseFile(file)
            allStudiesList = fileStudiesService.allStudiesList
            // Then
            XCTAssertFalse(allStudiesList.isEmpty)
            XCTAssertEqual(allStudiesList.count, 38)
            expectation.fulfill()
        } catch {
            print("error : \(error.localizedDescription)")
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testParseFileOfFileStudiesServiceShouldResultFailedCallbackIfErrorWorksheetName() {
        // Given
        let fileStudiesService = FileStudiesService()
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        guard let path = Bundle.main.path(forResource: "studies", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }
        do {
            try fileStudiesService.parseFile(file)
            for wbk in try file.parseWorkbooks() {
                for (name, _) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                    if let worksheetName = name {
                        // Then
                        XCTAssertEqual(worksheetName, "Etudes")
                        expectation.fulfill()
                    }
                }
            }
        } catch {
            print("error : \(error.localizedDescription)")
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Tests parseFile - FileSkillsService

    func testParseFileOfFileSkillsServiceShouldResultFailedCallbackIfNoErrorAndCorrectData() {
        // Given
        let fileSkillsService = FileSkillsService()
        var allSkillsList = [Skills]()
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        guard let path = Bundle.main.path(forResource: "skills", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }
        do {
            try fileSkillsService.parseFile(file)
            allSkillsList = fileSkillsService.allSkillsList
            // Then
            XCTAssertFalse(allSkillsList.isEmpty)
            XCTAssertEqual(allSkillsList.count, 18)
            expectation.fulfill()
        } catch {
            print("error : \(error.localizedDescription)")
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testParseFileOfFileSkillsServiceShouldResultFailedCallbackIfErrorWorksheetName() {
        // Given
        let fileSkillsService = FileSkillsService()
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        guard let path = Bundle.main.path(forResource: "skills", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }
        do {
            try fileSkillsService.parseFile(file)
            for wbk in try file.parseWorkbooks() {
                for (name, _) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                    if let worksheetName = name {
                        // Then
                        XCTAssertEqual(worksheetName, "Compétences")
                        expectation.fulfill()
                    }
                }
            }
        } catch {
            print("error : \(error.localizedDescription)")
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    // MARK: - Tests parseFile - FileExperiencesService
    
    func testParseFileOfFileExperiencesServiceShouldResultFailedCallbackIfNoErrorAndCorrectData() {
        // Given
        let fileExperiencesService = FileExperiencesService()
        var allExperiencesList = [Experiences]()
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        guard let path = Bundle.main.path(forResource: "experiences", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }
        do {
            try fileExperiencesService.parseFile(file)
            allExperiencesList = fileExperiencesService.allExperiencesList
            // Then
            XCTAssertFalse(allExperiencesList.isEmpty)
            XCTAssertEqual(allExperiencesList.count, 5)
            expectation.fulfill()
        } catch {
            print("error : \(error.localizedDescription)")
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testParseFileOfFileExperiencesServiceShouldResultFailedCallbackIfErrorWorksheetName() {
        // Given
        let fileExperiencesService = FileExperiencesService()
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        guard let path = Bundle.main.path(forResource: "experiences", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }
        do {
            try fileExperiencesService.parseFile(file)
            for wbk in try file.parseWorkbooks() {
                for (name, _) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                    if let worksheetName = name {
                        // Then
                        XCTAssertEqual(worksheetName, "Expériences")
                        expectation.fulfill()
                    }
                }
            }
        } catch {
            print("error : \(error.localizedDescription)")
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
