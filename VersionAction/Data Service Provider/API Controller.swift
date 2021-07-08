//
//  API Controller.swift
//  VersionAction
//
//  Created by Hanzala Raza on 09/07/2021.
//

//
//  ApiController.swift
//  Trendsfore
//
//  Created by Samran Ibrahim on 12/02/2021.
//  Copyright © 2021 Adroit Solution. All rights reserved.
//

import Foundation
import Moya
import UIKit
import Alamofire

let BASE_URL = URL(string: "https://api.smartwaytechnologies.com/api")!
let BASE_URL_IMAGE = URL(string:"https://api.smartwaytechnologies.com")

//let BASE_URL = URL(string: "http://192.168.0.113:8000/api")!
//let BASE_URL_IMAGE = URL(string:"http://192.168.0.113:8000")

enum MyApiClient {
    case Login(email:String , password:String)
    case VerifyUser(email:String , phone:String)
    case getCategory(index:Int)
    case getCommunity(index:Int)
//    case signup(signup:SignUp)
    case logout
    case verifyForgetPassword(phone:String)
    case changeForgetPassword(password:String , confirmPassword:String)
    case digitalVolunteerOption
    case digitalVolunteerLevels(roleId:Int)
    case digitalVolunteerInterest
    case digitalVolunteerBecomeAVolunteer(CategoryId:Int , RoleId:Int)
    case digitalVolunteerDigitalPassport
    case userProfile
    case userIntro
    case userActivity(index:Int)
    case userInitiative(index:Int)
    case userExperiences
    case updateUserProfile(name:String , country:String , Image:Data , ImageName:String ,IsUserMale:Int)
    case updateUserAbout(about:String)
    case addUserEducation(schoolName:String , fieldName:String , degreeName:String , isPresent:Int , startDate:String , endDate:String)
    case updateUserEducation(educationId:Int , schoolName:String , fieldName:String , degreeName:String , isPresent:Int , startDate:String , endDate:String)
    case updateUserSocialMedia(socialType:String , socialURL:String)
    case deleteUserEducation(educationId:Int)
    case addUserExperience(title:String , companyName:String , industryName:String , location:String , isPresent:Int , startDate:String , endDate:String)
    case updateUserExperience(experienceId:Int ,title:String , companyName:String , industryName:String , location:String , isPresent:Int , startDate:String , endDate:String)
    case deleteUserExperience(experienceId:Int)
    case deleteUserActivity(activityId:Int)
    case trendsforeCommunity(index:Int)
    case trendsforeInitiative(index:Int)
    case trendsforePages(index:Int)
    case getSpecificExperience(experienceId:Int)
    case getSpecificEducation(educationId:Int)
    case getAllOpportunity(index:Int)
    case getApplicantProfile
    case applyOpportuniy(opportunityId:Int , applicantPhone:String , applicantEmail:String , applicantResumeData:Data)
    case myBalance(index:Int)
    case packages(currencyType:String)
    case transactionPreview(transactionId:Int)
    case purchaseCoins(spentAmount:Int , recieveAmount:Int ,transactionRef:String)
    case purchaseStars(spentAmount:Int , recieveAmount:Int)
    case editInterest(interest:[Int])
    case userInterest
    case notification(index:Int)
    case specificPage(pageId:Int)
    case updatePage(pageId:Int , isDonationEnable:Int,isSponsorEnable:Int)
    case addPage(categoryId:Int , pageName:String , pageDescription:String, pageLocation:String , pagePhone:String , pageEmail:String , pageWebsite:String ,pageImage:Data , isPageUpgrade:Int , isDonationEnable:Int , isSponsorEnable:Int)
    case upgradePage(pageId:Int)
    case specificComunity(communityId:Int)
    case updateCommunity(communityId:Int , isDonationEnable:Int,isSponsorEnable:Int)
    case addCommunity(categoryId:Int , communityName:String , communityDescription:String, communityLocation:String , communityPhone:String , communityEmail:String , communityWebsite:String ,communityImage:Data , isPrivate:Int, isCommunityUpgrade:Int , isDonationEnable:Int , isSponsorEnable:Int)
    case upgradeCommunity(communityId:Int)
    case specificInitiative(initiativeId:Int)
    case launchInitiative(mainCategory:Int , subCategoryId:Int,referenceType:String,referenceId:Int, initiativeName:String,initiativeRegion:String , initiativeDescription:String,initiativeMinimumAmount:Int ,initiativeImage:Data,isDonateEnable:Int , IsUserAllowed:Int)
    case userNewActivity(index:Int)
    case complaint(complaint:String)
    case notificationNew(index:Int)
    case settingUpdateEmail(email:String)
    case settingUpdatePhone(phone:String)
    case settingChangePassword(currentPassword:String,newPassword:String , confirmPassword:String)
    case settingUserPages
    case settingUserPageSetting(pageId:Int)
    case settingUserPageEdit(pageId:Int)
    case settingUserPageDonation(pageId:Int , isDonationEnable:Int)
    case settingUserPageUpdate(pageId:Int ,categoryId:Int,pageName:String , pageLocation:String , pageEmail:String,pageDescription:String,pagePhone:String,pageWebsite:String,pageImage:Data)
    case settingUserCommunity
    case settingUserCommunitySettings(communityId:Int)
    case settingUserCommunityEdit(communityId:Int)
    case settingUserCommunityUpdate(communityId:Int ,categoryId:Int,communityName:String , communityLocation:String,communityEmail:String,communityDescription:String,communityPhone:String,communityWebsite:String,communityImage:Data)
    case settingUserCommunityPrivate(communityId:Int, isPrivate:Int)
    case settingUserCommunityDonation(communityId:Int , isDonationEnable:Int)
    case settingUserInitiatives
    case settingUserInitiativesEdit(initiativeId:Int)
    case settingUserInitiativesUpdate(initiativeId:Int , mainCategoryId:Int , subCategoryId:Int , initiativeName:String , initiativeRegion:String , initiativeMinimumAmount:Int , initiativeDescription:String , isUserAllowed:Int , isDonationAllowed:Int , initiativeImage:Data)
    case requestForApproval(communityId:Int)
    case requestAcceptReject(followId:Int , isAccepted:Int)
    case searchSuggestion(searchKeyword:String)
    case searchResult(searchKeyword:String)
    case searchHistory
    case searchClear
    case searchAddHistory(searchKeyword:String , searchType:String , searchTypeId:Int)
    case feedQuestion(categoryId:Int , page:Int)
    case feedCategory
    case questionPreview(questionId:Int)
    case questionStars(questionId:Int)
    case answerPreview(questionId:Int)
    case follow(referenceType:String , followingId:Int)
    case communityFollow(CommunityId:Int)
    case unfollow(followId:Int)
//    case submitAnswer(questionId:Int , questionType:String , answerType:String , answer:String , subAnswer:[SubAnswer]? , video:Data? , image:Data? , link:String?)
//    case askPollQuestion(categoryId:Int , questionHeadline:String , mainQuestion:String, questionOptions:[String], referenceType:String , referenceId:Int? , isPostedAnonumously:Int , isPublished:Int , subcategory:[Int] , subquestion:[SubquestionForAskQuestion]? , hashtag:[String] , location:[String], communityIdArr : [Int] , video:Data? , image:Data? , link:String?)
    case questionCategory
    case questionCommunities(searchTxt:String)
    case seeStars
    case starBalance
//    case questionStars()
}


extension MyApiClient : TargetType , AccessTokenAuthorizable {
    
    var authorizationType : AuthorizationType? {
        switch self {
        case .Login , .VerifyUser , .getCategory , .getCommunity ,.digitalVolunteerOption , .verifyForgetPassword :
            return .none
        default :
            return .bearer
        }
    }
    
    var baseURL: URL {
        return BASE_URL
    }
    
    var path: String {
        switch self {
        case .Login :
            return "/user/login"
        case .VerifyUser :
            return "/user/verify-user"
        case .getCategory:
            return "/user/interested-categories"
        case .getCommunity :
            return "/user/registration-communities"
//        case .signup :
//            return "/user/signup"
        case .logout :
            return "/user/logout"
        case .verifyForgetPassword:
            return "/user/verify-forget-password"
        case .changeForgetPassword:
            return "/user/change-forget-password"
        case .digitalVolunteerOption:
            return "/digital-volunteer/option"
        case .digitalVolunteerLevels:
            return "/digital-volunteer/volunteer-levels"
        case .digitalVolunteerInterest:
            return "/digital-volunteer/volunteer-interest"
        case .digitalVolunteerBecomeAVolunteer:
            return "/digital-volunteer/become-a-volunteer"
        case .digitalVolunteerDigitalPassport:
            return "/digital-volunteer/digital-passport"
        case .userProfile:
            return "/profile/user-profile"
        case .userIntro:
            return "/profile/user-intro"
        case .userExperiences:
            return "/profile/experiences"
        case .updateUserProfile:
            return "/profile/update-profile"
        case .updateUserAbout:
            return "/profile/update-about"
        case .addUserEducation:
            return "/profile/add-education"
        case .updateUserEducation:
            return "/profile/update-education"
        case .updateUserSocialMedia:
            return "/profile/update-social"
        case .deleteUserEducation:
            return "/profile/delete-education"
        case .addUserExperience:
            return "/profile/add-experience"
        case .updateUserExperience:
            return "/profile/update-experience"
        case .deleteUserExperience:
            return "/profile/delete-experience"
        case .deleteUserActivity:
            return "/profile/delete-activity"
        case .trendsforeCommunity :
            return "/community/trendsfore-community"
        case .trendsforeInitiative:
            return "/initiative/trendsfore-initiative"
        case .trendsforePages:
            return "/page/trendsfore-page"
        case .getSpecificExperience:
            return "/profile/experience"
        case .getSpecificEducation:
            return "/profile/education"
        case .userActivity:
            return "/profile/user-activity"
        case .userInitiative:
            return "/profile/user-initiative"
        case .getAllOpportunity:
            return "/opportunity/all-preview-opportunities"
        case .getApplicantProfile:
            return "/opportunity/applicant-profile"
        case .applyOpportuniy:
            return "/opportunity/apply-opportunity"
        case .myBalance:
            return "/wallet/balance"
        case .packages:
            return "/wallet/packages"
        case .transactionPreview:
            return "/wallet/transaction-preview"
        case .purchaseCoins:
            return "/wallet/purchase-coins"
        case .purchaseStars:
            return "/wallet/purchase-stars"
        case .editInterest:
            return "/user/edit-interest"
        case .userInterest:
            return "/user/user-interest"
        case .notification:
            return "/notification/notifications"
        case .specificPage:
            return "/page/page-profile"
        case .addPage:
            return "/page/add-page"
        case .updatePage:
            return "/page/update-features"
        case .upgradePage:
            return "/page/upgrade"
        case .specificComunity:
            return "/community/community-profile"
        case .updateCommunity:
            return "/community/update-features"
        case .addCommunity:
            return "/community/add-community"
        case .upgradeCommunity:
            return "/community/upgrade"
        case .specificInitiative:
            return "/initiative/initiative-profile"
        case .launchInitiative:
            return "/initiative/launch-initiative"
        case .userNewActivity:
            return "/profile/user-new-activity"
        case .complaint:
            return "/complaint/submit"
        case .notificationNew:
            return "/notification/new-notifications"
        case .settingUpdateEmail:
            return "/profile/update-email"
        case .settingUpdatePhone:
            return "/profile/update-phone"
        case .settingChangePassword:
            return "/profile/change-password"
        case .settingUserPages:
            return "/page/user-pages"
        case .settingUserPageSetting:
            return "/page/user-page-settings"
        case .settingUserPageEdit:
            return "/page/user-page-edit"
        case .settingUserPageDonation:
            return "/page/user-page-donation"
        case .settingUserPageUpdate:
            return "/page/user-page-update"
        case .settingUserCommunity:
            return "/community/user-communities"
        case .settingUserCommunitySettings:
            return "/community/user-community-settings"
        case .settingUserCommunityEdit:
            return "/community/user-community-edit"
        case .settingUserCommunityUpdate:
            return "/community/user-community-update"
        case .settingUserCommunityPrivate:
            return "/community/user-community-private"
        case .settingUserCommunityDonation:
            return "/community/user-community-donation"
        case .settingUserInitiatives:
            return "/initiative/user-initiatives"
        case .settingUserInitiativesEdit:
            return "/initiative/user-initiative-edit"
        case .settingUserInitiativesUpdate:
            return "/initiative/user-initiative-update"
        case .requestForApproval:
            return "/follower/community-request"
        case .requestAcceptReject:
            return "/follower/community-accept-reject"
        case .searchSuggestion:
            return "/search/suggestion"
        case .searchResult:
            return "/search/results"
        case .searchHistory:
            return "/search/history"
        case .searchClear:
            return "/search/clear"
        case .searchAddHistory:
            return "/search/add-history"
        case .feedQuestion:
            return "/home/questions"
        case .feedCategory:
            return "/home/categories"
        case .questionPreview:
            return "/home/full-question"
        case .questionStars:
            return "/home/question-stars"
        case .answerPreview:
            return "/answer/question"
        case .follow:
            return "/follower/follow"
        case .communityFollow:
            return "/follower/community-follow"
        case .unfollow:
            return "/follower/unfollow"
//        case .submitAnswer:
//            return "/answer/submit"
//        case .askPollQuestion:
//            return "/question/poll-question"
        case .questionCategory:
            return "/question/categories"
        case .questionCommunities:
            return "/question/communities"
        case .seeStars:
            return "/star/add"
        case .starBalance:
            return "/star/balance"
        }
 
    }
    
    
    
    var method: Moya.Method {
        switch self {
        case .getCategory , .getCommunity,.digitalVolunteerOption,.digitalVolunteerInterest , .digitalVolunteerLevels , .digitalVolunteerDigitalPassport , .userProfile , .userIntro, .userExperiences , .trendsforeCommunity , .trendsforeInitiative , .trendsforePages , .getSpecificExperience , .getSpecificEducation ,.userActivity , .userInitiative ,.getAllOpportunity ,.getApplicantProfile , .myBalance , .packages ,.transactionPreview ,.userInterest , .notification ,.specificPage , .specificComunity , .specificInitiative , .userNewActivity , .notificationNew , .settingUserPages , .settingUserPageSetting , .settingUserPageEdit , .settingUserCommunity , .settingUserCommunitySettings , .settingUserCommunityEdit , .settingUserInitiatives , .settingUserInitiativesEdit , .requestForApproval , .searchSuggestion , .searchResult , .searchHistory , .feedCategory , .feedQuestion , .questionPreview , .questionStars , .answerPreview , .questionCategory , .questionCommunities , .starBalance:
            return .get
        case .logout , .deleteUserActivity , .deleteUserEducation , .deleteUserExperience , .searchClear ,.unfollow   :
            return .delete
        case .digitalVolunteerBecomeAVolunteer , .updateUserAbout , .updateUserSocialMedia , .updateUserExperience , .updateUserEducation , .changeForgetPassword , .updatePage , .upgradePage , .updateCommunity , .upgradeCommunity , .settingUpdateEmail , .settingUpdatePhone , .settingChangePassword , .settingUserPageDonation , .settingUserCommunityPrivate , .settingUserCommunityDonation , .requestAcceptReject:
            return .put
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var sampleString: String {
            return String()
    }
    
    var referenceIdInt: Int {
            return Int()
    }
    
//    var arr : [SubquestionForAskQuestion] {
//        return [SubquestionForAskQuestion]()
//    }
//
//    var subAnswer : [SubAnswer] {
//        return [SubAnswer]()
//    }
    var task: Task {
        switch self {
        case .Login(let email, let password):
            return .requestParameters(parameters: ["email":email , "password":password], encoding: URLEncoding.httpBody)
        case .VerifyUser(let email, let phone) :
            return .requestParameters(parameters: ["email":email , "phone":phone], encoding: URLEncoding.httpBody)
        case .getCategory (let page) , .getCommunity(let page) , .getAllOpportunity(let page) ,.trendsforePages(let page) , .trendsforeCommunity(let page) , .trendsforeInitiative(let page) , .userActivity(let page) , .userInitiative(let page) , .myBalance(let page) , .notification(let page) , .userNewActivity(let page) , .notificationNew(let page):
            return .requestParameters(parameters: ["page":page], encoding: URLEncoding.default)
//        case .signup(let signUp):
//            return .requestJSONEncodable(signUp)
        case .logout , .digitalVolunteerOption , .digitalVolunteerInterest , .digitalVolunteerDigitalPassport , .userProfile , .userIntro , .userExperiences , .getApplicantProfile , .userInterest ,.settingUserPages , .settingUserCommunity , .settingUserInitiatives , .searchHistory , .searchClear , .feedCategory , .questionCategory , .starBalance , .seeStars:
            return .requestPlain
        case .verifyForgetPassword(let phone):
            return .requestParameters(parameters: ["phone":phone], encoding: URLEncoding.default)
        case .changeForgetPassword(let password, let confirmPassword):
            return .requestParameters(parameters: ["Password":password , "ConfirmPassword":confirmPassword], encoding: URLEncoding.httpBody)
        case .digitalVolunteerLevels(let roleId):
            return .requestParameters(parameters: ["OptionId":roleId], encoding: URLEncoding.default)
        case .digitalVolunteerBecomeAVolunteer (let categoryId , let roleId):
            return .requestParameters(parameters: ["CategoryId":categoryId , "OptionId":roleId], encoding: URLEncoding.default)
        case .updateUserProfile( let name, let country,  let Image, let ImageName , let IsUserMale):
            return .uploadCompositeMultipart([.init(provider: .data(Image), name: "image", fileName: ImageName, mimeType: "image/jpg")], urlParameters: ["name":name , "country":country , "IsUserMale":IsUserMale])
        case .updateUserAbout( let about):
        return .requestParameters(parameters: ["about":about], encoding: URLEncoding.default)
        case .addUserEducation(schoolName: let schoolName, fieldName: let fieldName, degreeName: let degreeName, isPresent: let isPresent, startDate: let startDate, endDate: let endDate):
        return .requestParameters(parameters: ["SchoolName":schoolName,"FieldName":fieldName,"DegreeName":degreeName,"StartDate":startDate,"EndDate":endDate,"IsPresent":isPresent], encoding: URLEncoding.httpBody)
        case .updateUserEducation( let educationId, let schoolName, let fieldName, let degreeName, let isPresent, let startDate, let endDate):
        return .requestParameters(parameters: ["EducationId":educationId,"SchoolName":schoolName,"FieldName":fieldName,"DegreeName":degreeName,"StartDate":startDate,"EndDate":endDate,"IsPresent":isPresent], encoding: URLEncoding.default)
        case .updateUserSocialMedia( let socialType, let socialURL):
            return .requestParameters(parameters: ["SocialType":socialType,"SocialUrl":socialURL], encoding: URLEncoding.default)
        case .deleteUserEducation(let educationId):
        return .requestParameters(parameters: ["EducationId":educationId], encoding: URLEncoding.default)
        case .addUserExperience( let title, let companyName,  let industryName, let location, let isPresent,  let startDate,  let endDate):
        return .requestParameters(parameters: ["Title":title, "CompanyName":companyName,"Industry":industryName,"Location":location , "IsPresent":isPresent,"StartDate":startDate,"EndDate":endDate], encoding: URLEncoding.httpBody)
        case .updateUserExperience( let experienceId,  let title,  let companyName,  let industryName,  let location,  let isPresent,  let startDate,  let endDate):
        return .requestParameters(parameters: ["ExperienceId":experienceId,"Title":title, "CompanyName":companyName,"Industry":industryName,"Location":location , "IsPresent":isPresent,"StartDate":startDate,"EndDate":endDate], encoding: URLEncoding.default)
        case .deleteUserExperience(let experienceId):
        return .requestParameters(parameters: ["ExperienceId":experienceId], encoding: URLEncoding.default)
        case .deleteUserActivity( let activityId):
        return .requestParameters(parameters: ["ActivityId":activityId], encoding: URLEncoding.default)
        case .getSpecificExperience (let id):
        return .requestParameters(parameters: ["ExperienceId":id], encoding: URLEncoding.default)
        case .getSpecificEducation(let id):
        return .requestParameters(parameters: ["EducationId":id], encoding: URLEncoding.default)
        case .applyOpportuniy(let opportunityId, let applicantPhone, let applicantEmail, let applicantResume):
        return .uploadCompositeMultipart([.init(provider: .data(applicantResume), name: "ApplicantResume", fileName: "ApplicantResume", mimeType: "file")], urlParameters: ["ApplicantPhone":applicantPhone , "ApplicantEmail":applicantEmail , "OpportunityId":opportunityId])
        case .purchaseCoins( let spentAmount, let recieveAmount, let transactionRef):
            return .requestParameters(parameters: ["SpentAmount":spentAmount,"ReceiveAmount":recieveAmount,"TransactionReference":transactionRef], encoding: URLEncoding.default)
        case .purchaseStars( let spentAmount, let recieveAmount):
            return .requestParameters(parameters: ["SpentAmount":spentAmount,"ReceiveAmount":recieveAmount], encoding: URLEncoding.default)
        case .packages(let currencyType):
            return .requestParameters(parameters: ["CurrencyType":currencyType], encoding: URLEncoding.default)
        case .transactionPreview(let transactionId):
            return .requestParameters(parameters: ["TransactionId":transactionId], encoding: URLEncoding.default)
        case .editInterest(let interest):
            return .requestParameters(parameters: ["Interest":interest], encoding: URLEncoding.default)
        case .specificPage(let pageId):
            return .requestParameters(parameters: ["PageId":pageId], encoding: URLEncoding.default)
        case .updatePage( let pageId, let isDonationEnable, let isSponsorEnable):
            return .requestParameters(parameters: ["PageId":pageId , "IsDonationEnable":isDonationEnable , "IsSponsorEnable":isSponsorEnable], encoding: URLEncoding.default)
        case .addPage(let categoryId, let pageName, let pageDescription, let pageLocation, let pagePhone,  let pageEmail, let pageWebsite, let pageImage, let isPageUpgrade, let isDonationEnable, let isSponsorEnable):
            return .uploadCompositeMultipart([.init(provider: .data(pageImage), name: "PageImage", fileName: "PageImage", mimeType: "file")], urlParameters: ["CategoryId":categoryId , "PageName":pageName , "PageDescription":pageDescription , "PageLocation":pageLocation , "PagePhone":pagePhone , "PageEmail":pageEmail , "PageWebsite":pageWebsite , "IsPageUpgrade":isPageUpgrade , "IsDonationEnable":isDonationEnable , "IsSponsorEnable":isSponsorEnable])
        case .upgradePage (let pageId):
            return .requestParameters(parameters: ["PageId":pageId], encoding: URLEncoding.default)
        case .specificComunity( let communityId):
            return .requestParameters(parameters: ["CommunityId":communityId], encoding: URLEncoding.default)
        case .updateCommunity(let communityId, let isDonationEnable, let isSponsorEnable):
            return .requestParameters(parameters: ["CommunityId":communityId , "IsDonationEnable":isDonationEnable,"IsSponsorEnable":isSponsorEnable], encoding: URLEncoding.default)
        case .addCommunity( let categoryId,let communityName, let communityDescription, let communityLocation, let communityPhone, let communityEmail, let communityWebsite, let communityImage, let isPrivate, let isCommunityUpgrade,let isDonationEnable, let isSponsorEnable):
            return .uploadCompositeMultipart([.init(provider: .data(communityImage), name: "CommunityImage", fileName: "CommunityImage", mimeType: "file")], urlParameters: ["CategoryId":categoryId , "CommunityName":communityName , "CommunityDescription":communityDescription , "CommunityLocation":communityLocation , "CommunityPhone":communityPhone , "CommunityEmail":communityEmail ,"IsPrivate":isPrivate, "CommunityWebsite":communityWebsite , "IsCommunityUpgrade":isCommunityUpgrade , "IsDonationEnable":isDonationEnable , "IsSponsorEnable":isSponsorEnable])
        case .upgradeCommunity(let communityId):
            return .requestParameters(parameters: ["CommunityId":communityId], encoding: URLEncoding.default)
        case .specificInitiative( let initiativeId):
            return .requestParameters(parameters: ["InitiativeId":initiativeId], encoding: URLEncoding.default)
        case .launchInitiative( let mainCategory, let subCategoryId, let referenceType, let referenceId, let initiativeName, let initiativeRegion, let initiativeDescription, let initiativeMinimumAmount, let initiativeImage, let isDonateEnable , let IsUserAllowed):
            return .uploadCompositeMultipart([.init(provider: .data(initiativeImage), name: "InitiativeImage", fileName: "InitiativeImage", mimeType: "file")], urlParameters: ["MainCategoryId":mainCategory , "SubCategoryId":subCategoryId , "ReferenceType":referenceType , "ReferenceId":referenceId , "InitiativeName":initiativeName, "InitiativeDescription":initiativeDescription,"InitiativeMinimumAmount":initiativeMinimumAmount,"InitiativeRegion":initiativeRegion , "InitiativeImage":initiativeImage , "IsDonationEnable":isDonateEnable , "IsUserAllowed":IsUserAllowed])
        case .complaint( let complaint):
            return .requestParameters(parameters: ["Complaint":complaint], encoding: URLEncoding.default)
        case .settingUpdateEmail(email: let email):
            return .requestParameters(parameters: ["email":email], encoding: URLEncoding.default)
        case .settingUpdatePhone(phone: let phone):
            return .requestParameters(parameters: ["phone":phone], encoding: URLEncoding.default)
        case .settingChangePassword(currentPassword: let currentPassword, newPassword: let newPassword, confirmPassword: let confirmPassword):
            return .requestParameters(parameters: ["CurrentPassword":currentPassword , "NewPassword":newPassword , "ConfirmPassword":confirmPassword], encoding: URLEncoding.default)
        case .settingUserPageSetting(pageId: let pageId):
            return .requestParameters(parameters: ["PageId":pageId], encoding: URLEncoding.default)
        case .settingUserPageEdit(pageId: let pageId):
            return .requestParameters(parameters: ["PageId":pageId], encoding: URLEncoding.default)
        case .settingUserPageDonation(pageId: let pageId, isDonationEnable: let isDonationEnable):
            return .requestParameters(parameters: ["PageId":pageId , "IsDonationEnable":isDonationEnable], encoding: URLEncoding.default)
        case .settingUserPageUpdate(pageId: let pageId, categoryId: let categoryId, pageName: let pageName, pageLocation: let pageLocation, pageEmail: let pageEmail, pageDescription: let pageDescription, pagePhone: let pagePhone, pageWebsite: let pageWebsite, pageImage: let pageImage):
            return .uploadCompositeMultipart([.init(provider: .data(pageImage), name: "PageImage", fileName: "PageImage", mimeType: "file")], urlParameters: ["PageId":pageId , "CategoryId":categoryId , "PageName":pageName , "PageLocation":pageLocation , "PageEmail":pageEmail , "PageDescription":pageDescription , "PagePhone":pagePhone , "PageWebsite":pageWebsite , "PageImage":pageImage])
        case .settingUserCommunitySettings(communityId: let communityId):
            return .requestParameters(parameters: ["CommunityId":communityId], encoding: URLEncoding.default)
        case .settingUserCommunityEdit(communityId: let communityId):
            return .requestParameters(parameters: ["CommunityId":communityId], encoding: URLEncoding.default)
        case .settingUserCommunityUpdate(communityId: let communityId, categoryId: let categoryId, communityName: let communityName, communityLocation: let communityLocation, communityEmail: let communityEmail, communityDescription: let communityDescription, communityPhone: let communityPhone, communityWebsite: let communityWebsite, communityImage: let communityImage):
            return .uploadCompositeMultipart([.init(provider: .data(communityImage), name: "CommunityImage", fileName: "CommunityImage", mimeType: "file")], urlParameters: ["CommunityId":communityId , "CategoryId":categoryId , "CommunityName":communityName , "CommunityLocation":communityLocation , "CommunityEmail":communityEmail , "CommunityDescription":communityDescription , "CommunityPhone":communityPhone , "CommunityWebsite":communityWebsite , "CommunityImage":communityImage])
        case .settingUserCommunityPrivate(communityId: let communityId, isPrivate: let isPrivate):
            return .requestParameters(parameters: ["CommunityId":communityId , "IsPrivate":isPrivate], encoding: URLEncoding.default)
        case .settingUserCommunityDonation(communityId: let communityId, isDonationEnable: let isDonationEnable):
            return .requestParameters(parameters: ["CommunityId":communityId , "IsDonationEnable":isDonationEnable], encoding: URLEncoding.default)
        case .settingUserInitiativesEdit(initiativeId: let initiativeId):
            return .requestParameters(parameters: ["InitiativeId":initiativeId], encoding: URLEncoding.default)
        case .settingUserInitiativesUpdate(initiativeId: let initiativeId, mainCategoryId: let mainCategoryId, subCategoryId: let subCategoryId, initiativeName: let initiativeName, initiativeRegion: let initiativeRegion, initiativeMinimumAmount: let initiativeMinimumAmount, initiativeDescription: let initiativeDescription, isUserAllowed: let isUserAllowed, isDonationAllowed: let isDonationAllowed, initiativeImage: let initiativeImage):
            return .uploadCompositeMultipart([.init(provider: .data(initiativeImage), name: "InitiativeImage", fileName: "InitiativeImage", mimeType: "file")], urlParameters: ["InitiativeId":initiativeId , "MainCategoryId":mainCategoryId ,"SubCategoryId":subCategoryId, "InitiativeName":initiativeName , "InitiativeRegion":initiativeRegion , "InitiativeMinimumAmount":initiativeMinimumAmount , "InitiativeDescription":initiativeDescription , "IsUserAllowed":isUserAllowed , "IsDonationEnable":isDonationAllowed , "InitiativeImage":initiativeImage])
        case .requestForApproval(communityId: let communityId):
            return .requestParameters(parameters: ["CommunityId":communityId], encoding: URLEncoding.default)
        case .requestAcceptReject(followId: let followId, isAccepted: let isAccepted):
            return .requestParameters(parameters: ["IsAccepted":isAccepted , "FollowId":followId], encoding: URLEncoding.default)

        case .searchSuggestion(searchKeyword: let searchKeyword):
            return .requestParameters(parameters: ["SearchKeyword":searchKeyword], encoding: URLEncoding.default)
        case .searchResult(searchKeyword: let searchKeyword):
            return .requestParameters(parameters: ["SearchKeyword":searchKeyword], encoding: URLEncoding.default)
        case .searchAddHistory(searchKeyword: let searchKeyword, searchType: let searchType, searchTypeId: let searchTypeId):
            return .requestParameters(parameters: ["SearchKeyword":searchKeyword , "SearchType":searchType , "SearchTypeId":searchTypeId], encoding: URLEncoding.default)
        case .feedQuestion( let categoryId , let page):
            return .requestParameters(parameters: ["CategoryId":categoryId , "page":page], encoding: URLEncoding.default)
        case .questionStars( let questionId) ,.questionPreview( let questionId) , .answerPreview(let questionId):
            return .requestParameters(parameters: ["QuestionId":questionId], encoding: URLEncoding.default)
        case .follow(referenceType: let referenceType, followingId: let followingId):
            return .requestParameters(parameters: ["ReferenceType":referenceType , "FollowingId":followingId], encoding: URLEncoding.default)
        case .unfollow(followId: let followId):
            return .requestParameters(parameters: ["FollowId":followId], encoding: URLEncoding.default)
        case .communityFollow(CommunityId: let communityId):
            return .requestParameters(parameters: ["CommunityId":communityId], encoding: URLEncoding.default)
//        case .submitAnswer(questionId: let questionId, questionType: let questionType, answerType: let answerType, answer: let answer, subAnswer: let submitAnswer, video: let video, image: let image, link: let link):
//            return .uploadCompositeMultipart([.init(provider: .data(video ?? sampleData), name: "Video") , .init(provider: .data(image ?? sampleData), name: "Image")], urlParameters: ["QuestionId" : questionId,"QuestionType":questionType, "AnswerType":answerType , "Answer":answer,"SubAnswer":submitAnswer ?? subAnswer, "Link":link ?? sampleString])
//        case .askPollQuestion(categoryId: let categoryId, questionHeadline: let questionHeadline, mainQuestion: let mainQuestion, questionOptions: let questionOptions, referenceType: let referenceType, referenceId: let referenceId, isPostedAnonumously: let isPostedAnonumously, isPublished: let isPublished, subcategory: let subcategory, subquestion: let subquestion, hashtag: let hashtag, location: let location, communityIdArr: let communityIdArr, video: let video, image: let image, link: let link):
//            return .uploadCompositeMultipart([.init(provider: .data(video ?? sampleData), name: "Video") , .init(provider: .data(image ?? sampleData), name: "Image")], urlParameters: ["CategoryId" : categoryId,"QuestionHeadline":questionHeadline, "MainQuestion":mainQuestion , "QuestionOption":questionOptions,"ReferenceType":referenceType , "Link":link ?? sampleString , "ReferenceId":referenceId ?? referenceIdInt , "IsPostedAnonymously":isPostedAnonumously , "IsPublished":isPublished , "SubCategory":subcategory , "SubQuestion":subquestion ?? arr, "Hashtag":hashtag , "Location":location, "Community":communityIdArr])
        case .questionCommunities(searchTxt: let searchTxt):
            return .requestParameters(parameters: ["SearchTxt":searchTxt], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}


func MoyaNetworkCallGenericFunction(_ target: MyApiClient, _ error:@escaping (MoyaError)->Void,_ result:@escaping (Response)->Void) {
    //let token = DBManager.shared.getAuthToken()
    //let authPlugin = AccessTokenPlugin { token }
//    let token = DBManager.shared.getAuthToken()
    let authPlugin = AccessTokenPlugin { _ in String() }
    let provider =  MoyaProvider<MyApiClient>(plugins: [VerbosePlugin(verbose: true),authPlugin])
    
    
    print("Parameters OF API ===========> Starting")
    dump(target)
    print("Parameters OF API ===========> Ending")
    dump(target)
    provider.request(target) { (Result) in
        switch Result {
        case .failure(let err):
            error(err)
        case .success(let res):
            print(res)
            if res.statusCode == 500{
//                UIApplication.showSimpleAlert("Internal server error.", "Status Code: 500")
                return
            }
            if res.statusCode == 401{
//                UIApplication.showSimpleAlert("Session Timeout", "","Ok"){
//                    DBManager.shared.removeUserData()
//                    Switcher.updateRootVC(isLoggedIn: false)
//                }
                return
            }
            result(res)
        }
    }
    
}

//JsonData Formatting
public func JSONResponseDataFormatter(_ data: Data) -> Data{
    
    do{
        let dataAsJson = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJson, options: .prettyPrinted)
        return prettyData
    }
    catch
    {
        return data
        
    }
}
struct VerbosePlugin: PluginType {
    let verbose: Bool
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        #if DEBUG
        if let body = request.httpBody,
            let str = String(data: body, encoding: .utf8) {
            if verbose {
                print("request to send: \(str))")
            }
        }
        #endif
        return request
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        #if DEBUG
        switch result {
        case .success(let body):
            if verbose {
                print("Response:")
                if let json = try? JSONSerialization.jsonObject(with: body.data, options: .mutableContainers) {
                    print(json)
                } else {
                    let response = String(data: body.data, encoding: .utf8)!
                    print(response)
                }
            }
        case .failure( _):
            break
        }
        #endif
    }
}

