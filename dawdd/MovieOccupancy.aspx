<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieOccupancy.aspx.cs" Inherits="dawdd.MovieOccupancy" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Theatre Occupancy Performer</title>
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
                        </ul>
                    </div>
            </div>
        </nav>

    <form id="form1" runat="server">
        <div class="container py-4">
            
            <div class="mb-4">
                <h2 class="fw-bold text-dark">📊 Movie Theatre City Hall Occupancy Performer</h2>
                <p class="text-secondary">Select a movie to view the Top 3 Theatre City Halls with maximum seat occupancy based on paid tickets.</p>
            </div>

            <div class="alert alert-info shadow-sm mb-4 border-0" role="alert">
                <span class="me-2">ℹ️</span> Only <strong>Paid</strong> tickets are counted towards seat occupancy percentage.
            </div>

            <div class="card shadow-sm mb-4 border-0">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <label class="form-label fw-bold mb-0">Select Movie:</label>
                        </div>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlMovie" runat="server"
                                AutoPostBack="true"
                                DataSourceID="SqlDataSourceDropDown"
                                DataTextField="MOVIE_TITLE"
                                DataValueField="MOVIEID"
                                AppendDataBoundItems="true"
                                CssClass="form-select">
                                <asp:ListItem Text="-- Select Movie --" Value="" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceDropDown" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT MovieID, Movie_Title FROM MOVIE ORDER BY Movie_Title">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceGrid" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM ( SELECT M.Movie_Title, TC.TheatreCity_Location, H.Hall_Name, H.Hall_Capacity, COUNT(T.TicketID) AS Paid_Tickets, ROUND((COUNT(T.TicketID) / H.Hall_Capacity) * 100, 2) AS Occupancy_Percentage FROM MOVIE M JOIN SHOWS S ON M.MovieID = S.MovieID JOIN HALL H ON S.HallID = H.HallID JOIN THEATRE_CITY TC ON H.TheatreCityID = TC.TheatreCityID JOIN TICKET_CUSTOMER TCU ON S.ShowID = TCU.ShowID JOIN TICKET T ON TCU.TicketID = T.TicketID WHERE M.MovieID = :MovieID AND T.Paid_Status = 'Paid' GROUP BY M.Movie_Title, TC.TheatreCity_Location, H.Hall_Name, H.Hall_Capacity ORDER BY Occupancy_Percentage DESC ) WHERE ROWNUM &lt;= 3">
                <SelectParameters>
                    <asp:ControlParameter Name="MovieID" ControlID="ddlMovie" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="card shadow-sm border-0">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server"
                        DataSourceID="SqlDataSourceGrid"
                        AutoGenerateColumns="false"
                        CssClass="table table-hover table-striped mb-0"
                        GridLines="None"
                        EmptyDataText="<div class='alert alert-warning m-3'>Please select a movie to view occupancy results.</div>"
                        AllowSorting="true">
                        <Columns>
                            <asp:TemplateField HeaderText="Rank">
                                <ItemTemplate>
                                    <span class="badge bg-primary px-3"><%# Container.DataItemIndex + 1 %></span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Movie Title" ItemStyle-CssClass="fw-bold" />
                            <asp:BoundField DataField="THEATRECITY_LOCATION" HeaderText="Theatre City Location" />
                            <asp:BoundField DataField="HALL_NAME" HeaderText="Hall Name" />
                            <asp:BoundField DataField="HALL_CAPACITY" HeaderText="Hall Capacity" />
                            <asp:BoundField DataField="PAID_TICKETS" HeaderText="Paid Tickets" />
                            <asp:BoundField DataField="OCCUPANCY_PERCENTAGE" HeaderText="Occupancy %" DataFormatString="{0:N2}%" ItemStyle-CssClass="text-success fw-bold" />
                        </Columns>
                        <HeaderStyle CssClass="table-dark text-nowrap" />
                    </asp:GridView>
                </div>
            </div>

        </div>
    </form>
</body>
</html>