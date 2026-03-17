<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="dawdd.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Management</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f8f9fa; }
        .card { margin-bottom: 20px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
            <div class="container">
                <a class="navbar-brand fw-bold" href="#">🎬 KumariCinemas</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Dashboard.aspx">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link" href="Movie.aspx">Movies</a></li>
                        <li class="nav-item"><a class="nav-link" href="Customer.aspx">Customers</a></li>
                        <li class="nav-item"><a class="nav-link" href="Shows.aspx">Shows</a></li>
                        <li class="nav-item"><a class="nav-link" href="Ticket.aspx">Tickets</a></li>
                        <li class="'nav-item"><a class="nav-link" href="UserTicket.aspx">User Ticket</a></li>
                        <li class="nav-item"><a class="nav-link" href="TheatreCityHallMovie.aspx">Theatre Report</a></li>
                        <li class="nav-item"><a class="nav-link" href="MovieOccupancy.aspx">Occupancy</a></li>
                    </div>
            </div>
        </nav>

    <form id="form1" runat="server">
        <div class="container pt-5">
            <div class="row">
                <div class="col-12 text-center mb-4">
                    <h2 class="display-5">Customer Directory</h2>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0">Manage Customer</h5>
                        </div>
                        <div class="card-body">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="CUSTOMERID" DataSourceID="SqlDataSource1" Width="100%">
                                <EditItemTemplate>
                                    <div class="mb-3">
                                        <label class="form-label">ID:</label>
                                        <asp:Label ID="CUSTOMERIDLabel1" runat="server" Text='<%# Eval("CUSTOMERID") %>' CssClass="form-control-plaintext fw-bold" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Username</label>
                                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Address</label>
                                        <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Email</label>
                                        <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control" />
                                    </div>
                                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-success btn-sm" Text="Update" />
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm" Text="Cancel" />
                                </EditItemTemplate>
                                
                                <InsertItemTemplate>
                                    <div class="mb-3">
                                        <label class="form-label">Customer ID</label>
                                        <asp:TextBox ID="CUSTOMERIDTextBox" runat="server" Text='<%# Bind("CUSTOMERID") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Username</label>
                                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Address</label>
                                        <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Email</label>
                                        <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control" />
                                    </div>
                                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" CssClass="btn btn-primary w-100" Text="Save Customer" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-link btn-sm d-block text-center mt-2" Text="Cancel" />
                                </InsertItemTemplate>
                                
                                <ItemTemplate>
                                    <asp:LinkButton ID="NewButton" runat="server" CommandName="New" CssClass="btn btn-outline-primary w-100" Text="+ Add New Customer" />
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body p-0">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CUSTOMERID" 
                                DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1"
                                CssClass="table table-hover table-striped mb-0" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="EditBtn" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-warning btn-action">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="SaveBtn" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success btn-action">Save</asp:LinkButton>
                                            <asp:LinkButton ID="CanBtn" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary btn-action">Cancel</asp:LinkButton>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CUSTOMERID" HeaderText="ID" ReadOnly="True" />
                                    <asp:BoundField DataField="USERNAME" HeaderText="Username" />
                                    <asp:BoundField DataField="ADDRESS" HeaderText="Address" />
                                    <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                                </Columns>
                                <HeaderStyle CssClass="table-dark" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM &quot;CUSTOMER&quot; WHERE &quot;CUSTOMERID&quot; = :CUSTOMERID" 
            InsertCommand="INSERT INTO &quot;CUSTOMER&quot; (&quot;CUSTOMERID&quot;, &quot;USERNAME&quot;, &quot;ADDRESS&quot;, &quot;EMAIL&quot;) VALUES (:CUSTOMERID, :USERNAME, :ADDRESS, :EMAIL)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT &quot;CUSTOMERID&quot;, &quot;USERNAME&quot;, &quot;ADDRESS&quot;, &quot;EMAIL&quot; FROM &quot;CUSTOMER&quot;" 
            UpdateCommand="UPDATE &quot;CUSTOMER&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;ADDRESS&quot; = :ADDRESS, &quot;EMAIL&quot; = :EMAIL WHERE &quot;CUSTOMERID&quot; = :CUSTOMERID">
            <DeleteParameters><asp:Parameter Name="CUSTOMERID" Type="String" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CUSTOMERID" Type="String" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="CUSTOMERID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
