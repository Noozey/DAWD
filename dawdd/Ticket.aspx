<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="dawdd.Ticket" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
            <h2 class="mb-4 text-primary text-center fw-bold">Ticket Management</h2>

            <div class="row g-4">
                
                <div class="col-lg-3">
                    <div class="card shadow border-0">
                        <div class="card-header bg-primary text-white py-3">
                            <h5 class="mb-0">Ticket Details</h5>
                        </div>
                        <div class="card-body">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" Width="100%">
                                <EditItemTemplate>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">TICKET ID:</label>
                                        <asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' CssClass="form-control bg-light" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">PRICE:</label>
                                        <asp:TextBox ID="TICKET_PRICETextBox" runat="server" Text='<%# Bind("TICKET_PRICE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">PAID STATUS:</label>
                                        <asp:TextBox ID="PAID_STATUSTextBox" runat="server" Text='<%# Bind("PAID_STATUS") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">BOOKING STATUS:</label>
                                        <asp:TextBox ID="BOOKING_STATUSTextBox" runat="server" Text='<%# Bind("BOOKING_STATUS") %>' CssClass="form-control" />
                                    </div>
                                    <div class="d-grid gap-2">
                                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-success" />
                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                    </div>
                                </EditItemTemplate>

                                <InsertItemTemplate>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small text-primary">TICKET ID:</label>
                                        <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' CssClass="form-control border-primary" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">TICKET PRICE:</label>
                                        <asp:TextBox ID="TICKET_PRICETextBox" runat="server" Text='<%# Bind("TICKET_PRICE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">PAID STATUS:</label>
                                        <asp:TextBox ID="PAID_STATUSTextBox" runat="server" Text='<%# Bind("PAID_STATUS") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">BOOKING STATUS:</label>
                                        <asp:TextBox ID="BOOKING_STATUSTextBox" runat="server" Text='<%# Bind("BOOKING_STATUS") %>' CssClass="form-control" />
                                    </div>
                                    <div class="d-grid gap-2 text-center">
                                        <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Save Ticket" CssClass="btn btn-primary fw-bold" />
                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-outline-secondary" />
                                    </div>
                                </InsertItemTemplate>

                                <ItemTemplate>
                                    <div class="text-center">
                                        <p class="text-muted small">Select a ticket to edit or</p>
                                        <asp:LinkButton ID="NewButton" runat="server" CommandName="New" Text="+ Add New Ticket" CssClass="btn btn-dark w-100" />
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card shadow border-0">
                        <div class="card-header bg-dark text-white py-3">
                            <h5 class="mb-0">Existing Tickets</h5>
                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TICKETID" 
                                DataSourceID="SqlDataSource1" CssClass="table table-hover table-striped mb-0" GridLines="None" Width="100%">
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
                                    <asp:BoundField DataField="TICKETID" HeaderText="ID" ReadOnly="True" SortExpression="TICKETID" />
                                    <asp:BoundField DataField="TICKET_PRICE" HeaderText="Price" SortExpression="TICKET_PRICE" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="PAID_STATUS" HeaderText="Paid" SortExpression="PAID_STATUS" />
                                    <asp:BoundField DataField="BOOKING_STATUS" HeaderText="Booking" SortExpression="BOOKING_STATUS" />
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
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;TICKETID&quot;, &quot;TICKET_PRICE&quot;, &quot;PAID_STATUS&quot;, &quot;BOOKING_STATUS&quot; FROM &quot;TICKET&quot;"
            InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKETID&quot;, &quot;TICKET_PRICE&quot;, &quot;PAID_STATUS&quot;, &quot;BOOKING_STATUS&quot;) VALUES (:TICKETID, :TICKET_PRICE, :PAID_STATUS, :BOOKING_STATUS)"
            UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;TICKET_PRICE&quot; = :TICKET_PRICE, &quot;PAID_STATUS&quot; = :PAID_STATUS, &quot;BOOKING_STATUS&quot; = :BOOKING_STATUS WHERE &quot;TICKETID&quot; = :TICKETID"
            DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKETID&quot; = :TICKETID">
            <DeleteParameters><asp:Parameter Name="TICKETID" Type="String" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TICKETID" Type="String" /><asp:Parameter Name="TICKET_PRICE" Type="Decimal" /><asp:Parameter Name="PAID_STATUS" Type="String" /><asp:Parameter Name="BOOKING_STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TICKET_PRICE" Type="Decimal" /><asp:Parameter Name="PAID_STATUS" Type="String" /><asp:Parameter Name="BOOKING_STATUS" Type="String" /><asp:Parameter Name="TICKETID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>