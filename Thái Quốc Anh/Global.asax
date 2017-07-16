<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="System.Data.SqlClient"%>

<script runat="server">

    SqlDataSource ds = new SqlDataSource();
    DataTable myCart;
    DataRow DR;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString());
    
    public void ConvertToDataTable(string s, ref DataTable dt)
    {
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["Conn"].ToString();
        ds.SelectCommand = s;
        DataSourceSelectArguments args = new DataSourceSelectArguments();
        DataView view = (DataView)ds.Select(args);
        dt = view.ToTable();
    }
    public DataTable MakeCart()
    {
        DataTable myCart = new DataTable();
        myCart.Columns.Add("Quantity", System.Type.GetType("System.Int32"));
        myCart.Columns.Add("Product", System.Type.GetType("System.String"));
        myCart.Columns.Add("Image", System.Type.GetType("System.String"));
        myCart.Columns.Add("Cost", System.Type.GetType("System.Decimal"));
        myCart.Columns.Add("Sum", System.Type.GetType("System.Decimal"));
        myCart.Columns.Add("ID", System.Type.GetType("System.String"));
        return myCart;
    }
    public void AddToCart(ref DataTable myCart, String Product, String Image, int Quantity, Decimal Cost, String ID)
    {
        bool blnMatch = false;
        foreach (DataRow DR in myCart.Rows)
            if (DR["Product"].ToString() == Product && !blnMatch)
            {
                int t = (int)DR["Quantity"] + Quantity;
                DR["Quantity"] = t.ToString();
                DR["Sum"] = Cost * t;
                blnMatch = true;
            }
        if (!blnMatch)
        {
            DR = myCart.NewRow();
            DR["Quantity"] = Quantity;
            DR["Product"] = Product;
            DR["Image"] = Image;
            DR["Cost"] = Cost;
            DR["Sum"] = Cost * Quantity;
            DR["ID"] = ID;
            myCart.Rows.Add(DR);
        }
    }





































    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
