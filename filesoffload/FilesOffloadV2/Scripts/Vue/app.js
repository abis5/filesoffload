const app = new Vue({
    el: '#app',

    data: {
        errors: [],
        successMessage: null,
        Company: Company,
        Department: Department,
        User: User,
        Cabinet: Cabinet

    },

    methods: {
        SaveRecord: function (action, newRecord, success) {
            var url = "/Home/" + action;

            axios({
                method: 'post',
                url: url,
                data: newRecord,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
            })
                .then(function (response) {
                    consoleLog('Data successfully created.');
                    success(response.data);
                })
                .catch(function (error) {
                    consoleLog('Failed to save data. Error:  ' + error);
                });
        },

        GetRecord: function (action, newRecord, success) {
            var url = "/Home/" + action;

            axios({
                method: 'post',
                url: url,
                data: newRecord,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
            })
                .then(function (response) {
                    consoleLog('Data successfully Fetched.');
                    success(response.data);
                })
                .catch(function (error) {
                    consoleLog('Failed to retrieve data. Error:  ' + error);
                });
        },

        showSuccessMessage: function (msg) {
            this.successMessage = msg;
            setTimeout(function () { this.successMessage = null; }, 2000);
        },

        /*----- Compnay Operations -----*/
        companySaved: function (data) {
            consoleLog('Company Saved. Record ID: ' + data);
            this.showSuccessMessage("Company saved.");
        },

        validateCompany: function (e) {
            if (this.Company.Name &&
                this.Company.Description
            ) this.saveCompany();

            this.errors = [];
            if (!this.Company.Name) this.errors.push("Name is required.");
            if (!this.Company.Description) this.errors.push("Description is required.");
            e.preventDefault();
        },

        saveCompany: function () {
            var newCompany = {
                Name: Company.Name,
                Description: Company.Description
            };

            Company.Name = null;
            Company.Description = null;

            this.SaveRecord("CreateCompany", newCompany, this.companySaved);
        },

        /*----- End of Compnay Operations -----*/

        /*----- Department Operations -----*/
        departmentSaved: function (id) {
            //consoleLog('Department Saved. Record ID: ' + data);
            if (id > 0)
                this.successMessage = "Saved...";
            else
                this.successMessage = "Error in saving...";
        },

        validateDepartment: function (e) {
            if (this.Department.Name) this.saveDepartment();

            this.errors = [];
            if (!this.Department.Name) this.errors.push("Name required.");
            e.preventDefault();
        },

        saveDepartment: function () {
            var newDepartment = {
                Name: Department.Name,
                Description: Department.Description
            };

            this.SaveRecord("CreateDepartment", newDepartment, this.departmentSaved)
        },

        /*----- End of Department Operations -----*/
        
        /*----- Login Operations -----*/
        userValidated: function (id) {
            //consoleLog('Department Saved. Record ID: ' + data);
            if (id > 0)
                this.successMessage = "Saved...";
            else
                this.successMessage = "Error in saving...";
        },
        validateUser: function (e) {

            if (this.User.Email) this.LoginUser();

            this.errors = [];
            if (!this.User.Email) this.errors.push("User Email required.");
            //if (!this.User.Description) this.errors.push("Description is required.");
            e.preventDefault();
        },
        LoginUser: function () {
            var newUser = {
                Email: User.Email,
                Password: User.Password
            };
            
            this.GetRecord("GetUser", newUser, this.userValidated)
        },

        /*----- END Login Operations -----*/

        /*----- USER Operations -----*/
        validateNewUser: function (e) {

            if (this.User.Email) this.saveUser();

            this.errors = [];
            if (!this.User.Email) this.errors.push("User Email required.");
            //if (!this.User.Description) this.errors.push("Description is required.");
            e.preventDefault();
        },
        UserSaved: function (data) {
            consoleLog('User Saved. Record ID: ' + data);
            this.showSuccessMessage("User saved.");
        },



        saveUser: function () {
            var newUser = {
                FirstName: User.FirstName,
                LastName: User.LastName,
                UserType: User.UserType,
                Email: User.Email,
                Password: User.Password
                //DepartmentId: User.DepartmentId,
                //Picture: User.Picture,
                //CreatedOn: User.CreatedOn,
                //CreatedBy: User.CreatedBy,
                //UpdatedOn: User.UpdatedOn,
                //UpdatedBy: User.UpdatedBy
                
            };

            User.FirstName = null;
            User.LastName = null;
            User.UserType = null;
            User.Email = null;
            User.Psasword = null;
            //User.DepartmentId : null;
            //User.Picture : null;
            //User.CreatedOn : null;
            //User.CreatedBy : null;
            //User.UpdatedBy : null;

            this.SaveRecord("CreateUser", newUser, this.UserSaved)
        },

        /*----- END of User Operations -----*/

        /*----- Cabinet Operations -----*/
        validateNewCabinet: function (e) {

            if (this.Cabinet.CabinetCode) this.saveCabinet();

            this.errors = [];
            if (!this.Cabinet.CabinetCode) this.errors.push("Cabinet Code required.");
            e.preventDefault();
        },
        CabinetSaved: function (data) {
            consoleLog('Cabinet Saved. Record ID: ' + data);
            this.showSuccessMessage("Cabinet saved.");
        },



        saveCabinet: function () {
            var newCabinet = {
                CabinetCode: Cabinet.CabinetCode,
                //DepartmentId: Cabinet.DepartmentId,
                NumberOfDrawers: Cabinet.NumberOfDrawers,
                //CreatedOn: Cabinet.CreatedOn,
                //CreatedBy: Cabinet.CreatedBy,
                //UpdatedOn: Cabinet.UpdatedOn,
                //UpdatedBy: Cabinet.UpdatedBy

            };

            Cabinet.CabinetCode = null;
            
            //Cabinet.DepartmentId : null;
            //Cabinet.Picture : null;
            //Cabinet.CreatedOn : null;
            //Cabinet.CreatedBy : null;
            //Cabinet.UpdatedBy : null;

            this.SaveRecord("CreateCabinet", newCabinet, this.CabinetSaved)
        },

        /*----- END of Cabinet Operations -----*/
    }   //End of methods

});
