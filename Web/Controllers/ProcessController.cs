using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models.VModel;

namespace Web.Controllers
{
    public class ProcessController : Controller
    {
        // GET: Process
        [HttpPost]
        [ValidateAntiForgeryToken]
        public string CreateQuestion(ConstantFormModel model)
        {
            if (model == null)
            {

            }


            return "";
        }
    }
}