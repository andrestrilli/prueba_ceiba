//
//  prueba_ceibaTests.swift
//  prueba_ceibaTests
//
//  Created by andres padilla on 8/01/23.
//

@testable import prueba_ceiba
import XCTest


final class prueba_ceibaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_get_users() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let repo = UserRepository.repository
        
        Task.init {
            let users = await  repo.getUsers()
            
            //Trae informacion
            assert(users.count > 0)
            
        }
        
    }

    func test_get_posts_by_user() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let user_id = "2"
        
        let repo = PostRepository.repository
        
        Task.init {
            let posts = await  repo.getPostByUser(idUser: user_id)
            
            //Trae informacion
            assert(posts.count > 0)
            
        }
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
