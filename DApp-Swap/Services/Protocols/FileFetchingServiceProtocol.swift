import Foundation

protocol FileFetchingServiceProtocol {
    func asyncDownload<T>(url: URL) async throws -> T?
    func handleResponse<T>(data: Data?, response: URLResponse?) -> T?
}
