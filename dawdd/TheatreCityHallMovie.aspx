<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheatreCityHallMovie.aspx.cs" Inherits="dawdd.TheatreCityHallMovie" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Theatre City Hall Movie Report</title>
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
                <h2 class="fw-bold text-dark">🎬 Theatre City Hall Movie Report</h2>
                <p class="text-secondary">Select a Theatre City to view all movies and showtimes available in its halls.</p>
            </div>

            <div class="card shadow-sm mb-4 border-0">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <label class="form-label fw-bold mb-0">Select Theatre City:</label>
                        </div>
                        <div class="col-md-4">
                            <asp:DropDownList ID="ddlTheatreCity" runat="server"
                                AutoPostBack="true"
                                DataSourceID="SqlDataSourceDropDown"
                                DataTextField="THEATRECITY_LOCATION"
                                DataValueField="THEATRECITYID"
                                AppendDataBoundItems="true"
                                CssClass="form-select">
                                <asp:ListItem Text="-- Select Theatre City --" Value="" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceDropDown" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT TheatreCityID, TheatreCity_Location FROM THEATRE_CITY ORDER BY TheatreCity_Location">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceGrid" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT TC.TheatreCityID, TC.TheatreCity_Location, H.HallID, H.Hall_Name, H.Hall_Capacity, M.MovieID, M.Movie_Title, M.Movie_Genre, M.Movie_Duration, M.Movie_Language, S.ShowID, S.Show_Date, S.Show_Time, S.Base_Price FROM THEATRE_CITY TC JOIN HALL H ON TC.TheatreCityID = H.TheatreCityID JOIN SHOWS S ON H.HallID = S.HallID JOIN MOVIE M ON S.MovieID = M.MovieID WHERE TC.TheatreCityID = :TheatreCityID ORDER BY S.Show_Date, S.Show_Time">
                <SelectParameters>
                    <asp:ControlParameter Name="TheatreCityID" ControlID="ddlTheatreCity" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="card shadow-sm border-0">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server"
                        DataSourceID="SqlDataSourceGrid"
                        AutoGenerateColumns="false"
                        CssClass="table table-hover table-striped mb-0"
                        GridLines="None"
                        EmptyDataText="<div class='alert alert-warning m-3'>Please select a Theatre City to view results.</div>"
                        AllowPaging="true"
                        PageSize="10"
                        AllowSorting="true">
                        <Columns>
                            <asp:BoundField DataField="THEATRECITY_LOCATION" HeaderText="Theatre Location"  />
                            <asp:BoundField DataField="HALL_NAME" HeaderText="Hall Name" />
                            <asp:BoundField DataField="HALL_CAPACITY" HeaderText="Capacity"  />
                            <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Movie Title"  ItemStyle-CssClass="fw-bold" />
                            <asp:BoundField DataField="MOVIE_GENRE" HeaderText="Genre" />
                            <asp:BoundField DataField="MOVIE_DURATION" HeaderText="Duration (mins)"  />
                            <asp:BoundField DataField="MOVIE_LANGUAGE" HeaderText="Language" />
                            <asp:BoundField DataField="SHOW_DATE" HeaderText="Show Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="SHOW_TIME" HeaderText="Show Time"  />
                            <asp:BoundField DataField="BASE_PRICE" HeaderText="Base Price (NPR)"  DataFormatString="{0:N2}" ItemStyle-CssClass="text-success fw-bold" />
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