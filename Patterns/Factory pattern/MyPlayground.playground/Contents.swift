import UIKit

/**
Thank you for taking time and watching the vide, if you have questions then please feel free to ask them via comments or via email.

 If you are new to the channel, I request you to please subscribe to the channel as the more people subscribe the more it motivates me to bring quality content for free.

 Do share the channel with your iOS group and do let me know what I can do better to improve my content or any video requests you can think of

 Thank you once again, have a nice day

 Ravi a.k.a codecat15

 */


// Model
struct Report {

    let id : UUID
    let year: Int
    let total: Double

    static func generateDummyReport() -> Array<Report> {

        return [Report(id: UUID(), year: Int.random(in: 2015..<2022), total: Double.random(in: 2000..<5000)),
                Report(id: UUID(), year: Int.random(in: 2015..<2022), total: Double.random(in: 2000..<5000))]
    }
}

protocol ReportProtocol {
    func getReport() -> Array<Report>
}

class TaxReport : ReportProtocol {

    func getReport() -> Array<Report> {
        print("fetching tax report")
        return Report.generateDummyReport()
    }
}

class ProfitReport : ReportProtocol {

    func getReport() -> Array<Report> {
        
        // code for calculating profit report
        print("fetching profit report")
        return Report.generateDummyReport()
    }
}

class FinanceReport : ReportProtocol {
    func getReport() -> Array<Report> {

        // code for calculating profit report
        print("fetching finance report")
        return Report.generateDummyReport()
    }
}

enum ReportType {
    case tax
    case profit
    case finance
}

class ReportFactory {
    static func create(type: ReportType) -> ReportProtocol {

        switch type {
        case .tax:
            return TaxReport()
        case .profit:
            return ProfitReport()
        case .finance:
            return FinanceReport()
        }
    }
}

class ReportViewModel {
    private let report : ReportProtocol

    init(_report : ReportProtocol) {
        report = _report
    }
    func getReport() -> Array<Report> {
        return report.getReport()
    }
}

let reportViewModel = ReportViewModel(_report: ReportFactory.create(type: .finance))
reportViewModel.getReport()
