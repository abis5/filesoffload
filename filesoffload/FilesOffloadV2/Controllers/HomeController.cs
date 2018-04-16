//using IVS.FilesOffload.BLL;
//using IVS.FilesOffload.DAL;
//using IVS.FilesOffload.VM;
using System.Web.Mvc;
using FilesOffloadV2.Models;

namespace IVS.FilesOffload.WebApp.Controllers
{
    public class HomeController : Controller
    {

        private FilesOffloadDBEntities db = new FilesOffloadDBEntities();
        //private readonly IVM<CompanyVM> _companyBL;
        //private readonly IVM<DepartmentVM> _departmentBL;
        //private readonly IVM<UserVM> _userBL;

        //public HomeController() { }

        ////dependency injection
        //public HomeController(IVM<CompanyVM> companyBL,
        //    IVM<DepartmentVM> departmentBL,
        //    IVM<UserVM> userBL
        //    )
        //{
        //    _companyBL = companyBL;
        //    _departmentBL = departmentBL;
        //    _userBL = userBL;
        //}
        public ActionResult Index()
        {
            //return RedirectToAction("Index", "Company");
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Form()
        {
            //return RedirectToAction("Index", "Company");
            return View();
        }


        public ActionResult Create()
        {
            return View();
        }

        

        
        public ActionResult Dashboard()
        {
            return View();
        }

        public ActionResult login()
        {
            return View();
        }

        public ActionResult user()
        {
            return View();
        }
        public ActionResult UserList()
        {
            return View();
        }

        public ActionResult test()
        {
            return View();
        }

        public ActionResult RecordRoom()
        {
            return View();
        }

        
        #region "Company"

        ///*****************COMPANY************************/


        [HttpPost]
        public ActionResult CreateCompany(Company company)
        {
            if (ModelState.IsValid)
            {
                db.Companies.Add(company);
                db.SaveChanges();
                int id = company.ID;

                return Json(id, JsonRequestBehavior.AllowGet);
            }

            return Json(0, JsonRequestBehavior.AllowGet);
        }
        /*****************END COMPANY************************/
        #endregion

        #region "Department"

        /*****************DEPARTMENT************************/
        public ActionResult Department()
        {
            return View();
        }
        public ActionResult CreateDepartment()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateDepartment(Department department)
        {
            if (ModelState.IsValid)
            {
                db.Departments.Add(department);
                db.SaveChanges();
                int id = department.ID;

                return Json(id, JsonRequestBehavior.AllowGet);
            }

            return Json(0, JsonRequestBehavior.AllowGet);
        }
        /*****************END DEPARTMENT************************/
        #endregion

        #region "User"

        /*****************USER************************/
        public ActionResult CreateUser()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateUser(User user)
        {
            if (ModelState.IsValid)
            {

                db.Users.Add(user);
                db.SaveChanges();
                int id = user.ID;

                return Json(id, JsonRequestBehavior.AllowGet);
            }

            return Json(null, JsonRequestBehavior.AllowGet);
        }
        /*****************END DEPARTMENT************************/
        #endregion


        #region "Cabinet"

        /*****************Cabinet************************/
        public ActionResult CreateCabinet()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateCabinet(Cabinet Cabinet)
        {
            if (ModelState.IsValid)
            {
                
                
                db.Cabinets.Add(Cabinet);
                for (int i = 1; i <= Cabinet.NumberOfDrawers; i++)
                {
                    Drawer drawer = new Drawer();
                    drawer.CabinetId = Cabinet.ID;
                    drawer.DrawerCode = i.ToString();
                    db.Drawers.Add(drawer);
                }
                db.SaveChanges();
                int id = Cabinet.ID;

                return Json(id, JsonRequestBehavior.AllowGet);
            }

            return Json(null, JsonRequestBehavior.AllowGet);
        }

        
        /*****************END Cabinet************************/
        #endregion


    }
}