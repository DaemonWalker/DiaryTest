using DiaryTest.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace DiaryTest.Controllers
{
    public class DiaryController : Controller
    {
        private readonly ILogger<DiaryController> _logger;

        public DiaryController(ILogger<DiaryController> logger)
        {
            _logger = logger;
        }


        [Route("[controller]/{id}")]
        public IActionResult Index(string id)
        {
            ViewBag.Title = id;
            ViewBag.Description = "今天小编来给大家介绍一下" + id;
            return View();
        }
    }
}
