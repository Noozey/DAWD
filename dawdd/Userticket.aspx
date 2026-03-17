<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userticket.aspx.cs" Inherits="dawdd.Userticket" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Ticket Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
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

        <div class="container py-4">
            
            <div class="mb-4">
                <h2 class="fw-bold text-dark">🎟️ User Ticket Report</h2>
                <p class="text-secondary">Select a customer to view all tickets purchased in the last 6 months.</p>
            </div>

            <div class="card shadow-sm mb-4 border-0">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <label class="form-label fw-bold mb-0">Select Customer:</label>
                        </div>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlCustomer" runat="server"
                                AutoPostBack="True"
                                DataSourceID="SqlDataSourceDropDown"
                                DataTextField="USERNAME"
                                DataValueField="CUSTOMERID"
                                AppendDataBoundItems="true"
                                CssClass="form-select">
                                <asp:ListItem Text="-- Select Customer --" Value="" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceDropDown" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT CustomerID, Username FROM CUSTOMER ORDER BY Username">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceGrid" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT C.CustomerID, C.Username, C.Address, C.Email, T.TicketID, T.Ticket_Price, T.Paid_Status, T.Booking_Status, TC.Purchase_Date, M.Movie_Title, S.Show_Date, S.Show_Time, TC2.TheatreCity_Location, H.Hall_Name FROM CUSTOMER C JOIN TICKET_CUSTOMER TC ON C.CustomerID = TC.CustomerID JOIN TICKET T ON TC.TicketID = T.TicketID JOIN SHOWS S ON TC.ShowID = S.ShowID JOIN MOVIE M ON S.MovieID = M.MovieID JOIN HALL H ON S.HallID = H.HallID JOIN THEATRE_CITY TC2 ON H.TheatreCityID = TC2.TheatreCityID WHERE C.CustomerID = :CustomerID AND TC.Purchase_Date &gt;= ADD_MONTHS(SYSDATE, -6) ORDER BY TC.Purchase_Date DESC">
                <SelectParameters>
                    <asp:ControlParameter Name="CustomerID" ControlID="ddlCustomer" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="card shadow-sm border-0">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server"
                        DataSourceID="SqlDataSourceGrid"
                        AutoGenerateColumns="false"
                        CssClass="table table-hover table-striped mb-0"
                        GridLines="None"
                        EmptyDataText="<div class='alert alert-warning m-3'>Please select a customer to view results.</div>"
                        AllowPaging="true"
                        PageSize="10"
                        AllowSorting="true">
                        <Columns>
                            <asp:BoundField DataField="CUSTOMERID" HeaderText="ID" />
                            <asp:BoundField DataField="USERNAME" HeaderText="User"  />
                            <asp:BoundField DataField="ADDRESS" HeaderText="Address" />
                            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                            <asp:BoundField DataField="TICKETID" HeaderText="Ticket" />
                            <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Movie" ItemStyle-CssClass="fw-bold" />
                            <asp:BoundField DataField="THEATRECITY_LOCATION" HeaderText="Location" />
                            <asp:BoundField DataField="HALL_NAME" HeaderText="Hall" />
                            <asp:BoundField DataField="SHOW_DATE" HeaderText="Show Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="SHOW_TIME" HeaderText="Time" />
                            <asp:BoundField DataField="TICKET_PRICE" HeaderText="Price" DataFormatString="{0:N2}" ItemStyle-CssClass="text-success fw-bold" />
                            <asp:BoundField DataField="PAID_STATUS" HeaderText="Paid" />
                            <asp:BoundField DataField="BOOKING_STATUS" HeaderText="Status" />
                            <asp:BoundField DataField="PURCHASE_DATE" HeaderText="Purchased" DataFormatString="{0:dd-MMM-yyyy}" />
                        </Columns>
                        <HeaderStyle CssClass="table-dark text-nowrap" />
                        <PagerStyle CssClass="pagination justify-content-center p-2 bg-light" />
                    </asp:GridView>
                </div>
            </div>

        </div>
    </form>
</body>
</html>