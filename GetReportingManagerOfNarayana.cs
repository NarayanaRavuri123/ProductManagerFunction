using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;

namespace ProductManagerFunction;

public class GetReportingManagerOfNarayana
{
    private readonly ILogger<GetReportingManagerOfNarayana> _logger;

    public GetReportingManagerOfNarayana(ILogger<GetReportingManagerOfNarayana> logger)
    {
        _logger = logger;
    }

    [Function("getReportingManagerOfNarayana")]
    public IActionResult Run([HttpTrigger(AuthorizationLevel.Anonymous, "get")] HttpRequest req)
    {
        _logger.LogInformation("C# HTTP trigger function processed a request.");
        return new OkObjectResult("Welcome to Azure Functions!");
    }
}