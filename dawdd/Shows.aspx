<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shows.aspx.cs" Inherits="dawdd.Shows" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Management</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
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
        <div class="container-fluid py-4">
            <h2 class="mb-4 text-center">Show Management</h2>

            <div class="row">
                
                <div class="col-lg-8 mb-4">
                    <div class="card shadow-sm h-100">
                        <div class="card-header bg-dark text-white">
                            <h5 class="mb-0">Existing Shows</h5>
                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SHOWID" 
                                DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover mb-0" GridLines="None">
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
                                    <asp:BoundField DataField="SHOWID" HeaderText="SHOWID" ReadOnly="True" SortExpression="SHOWID" />
                                    <asp:BoundField DataField="HALLID" HeaderText="HALLID" SortExpression="HALLID" />
                                    <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" SortExpression="MOVIEID" />
                                    <asp:BoundField DataField="SHOW_DATE" HeaderText="SHOW_DATE" SortExpression="SHOW_DATE" />
                                    <asp:BoundField DataField="SHOW_TIME" HeaderText="SHOW_TIME" SortExpression="SHOW_TIME" />
                                    <asp:BoundField DataField="BASE_PRICE" HeaderText="BASE_PRICE" SortExpression="BASE_PRICE" />
                                </Columns>
                                <HeaderStyle CssClass="table-dark" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 mb-4">
                    <div class="card shadow-sm ">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0">Manage Show Details</h5>
                        </div>
                        <div class="card-body">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" Width="100%">
                                <EditItemTemplate>
                                    <div class="mb-2">
                                        SHOWID: <asp:Label ID="SHOWIDLabel1" runat="server" Text='<%# Eval("SHOWID") %>' CssClass="fw-bold" />
                                    </div>
                                    <div class="mb-2">
                                        HALLID: <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        MOVIEID: <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        SHOW_DATE: <asp:TextBox ID="SHOW_DATETextBox" runat="server" Text='<%# Bind("SHOW_DATE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        SHOW_TIME: <asp:TextBox ID="SHOW_TIMETextBox" runat="server" Text='<%# Bind("SHOW_TIME") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        BASE_PRICE: <asp:TextBox ID="BASE_PRICETextBox" runat="server" Text='<%# Bind("BASE_PRICE") %>' CssClass="form-control" />
                                    </div>
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-success btn-sm" />
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                                </EditItemTemplate>

                                <InsertItemTemplate>
                                    <div class="mb-2">
                                        SHOWID: <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        HALLID: <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        MOVIEID: <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        SHOW_DATE: <asp:TextBox ID="SHOW_DATETextBox" runat="server" Text='<%# Bind("SHOW_DATE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        SHOW_TIME: <asp:TextBox ID="SHOW_TIMETextBox" runat="server" Text='<%# Bind("SHOW_TIME") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        BASE_PRICE: <asp:TextBox ID="BASE_PRICETextBox" runat="server" Text='<%# Bind("BASE_PRICE") %>' CssClass="form-control" />
                                    </div>
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary btn-sm" />
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                                </InsertItemTemplate>

                                <ItemTemplate>
                                    
                                    <asp:LinkButton ID="NewButton" runat="server" CommandName="New" CssClass="btn btn-outline-primary btn-sm w-100" Text="Add New Show" />
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>

            </div> <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;SHOWS&quot;" DeleteCommand="DELETE FROM &quot;SHOWS&quot; WHERE &quot;SHOWID&quot; = :SHOWID" InsertCommand="INSERT INTO &quot;SHOWS&quot; (&quot;SHOWID&quot;, &quot;HALLID&quot;, &quot;MOVIEID&quot;, &quot;SHOW_DATE&quot;, &quot;SHOW_TIME&quot;, &quot;BASE_PRICE&quot;) VALUES (:SHOWID, :HALLID, :MOVIEID, :SHOW_DATE, :SHOW_TIME, :BASE_PRICE)" UpdateCommand="UPDATE &quot;SHOWS&quot; SET &quot;HALLID&quot; = :HALLID, &quot;MOVIEID&quot; = :MOVIEID, &quot;SHOW_DATE&quot; = :SHOW_DATE, &quot;SHOW_TIME&quot; = :SHOW_TIME, &quot;BASE_PRICE&quot; = :BASE_PRICE WHERE &quot;SHOWID&quot; = :SHOWID">
                <DeleteParameters>
                    <asp:Parameter Name="SHOWID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SHOWID" Type="String" />
                    <asp:Parameter Name="HALLID" Type="String" />
                    <asp:Parameter Name="MOVIEID" Type="String" />
                    <asp:Parameter Name="SHOW_DATE" Type="DateTime" />
                    <asp:Parameter Name="SHOW_TIME" Type="String" />
                    <asp:Parameter Name="BASE_PRICE" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HALLID" Type="String" />
                    <asp:Parameter Name="MOVIEID" Type="String" />
                    <asp:Parameter Name="SHOW_DATE" Type="DateTime" />
                    <asp:Parameter Name="SHOW_TIME" Type="String" />
                    <asp:Parameter Name="BASE_PRICE" Type="Decimal" />
                    <asp:Parameter Name="SHOWID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>