using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class server_AjaxSvr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e1)
    {
        List<User> userList = new List<User>();
        User user = new User();
        user.Age = 20;
        user.Name = "Johny";
        user.City = "California";
        user.Address = "Ford street, New york.";

        userList.Add(user);

        string jsonString = JsonConvert.SerializeObject(userList);
        Console.WriteLine(jsonString);

        Response.Write(jsonString);
        // string name = m.name;
        // Bad Boys
    }
    
}
public class Employee
    {
        public string Name;
        public int Age;
    }
class User
{
    public int Age { get; set; }
    public string Name { get; set; }
    public string City { get; set; }
    public string Address { get; set; }
}