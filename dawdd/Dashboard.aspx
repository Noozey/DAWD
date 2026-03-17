<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="dawdd.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KumariCinemas - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .stat-card { transition: transform 0.2s; border: none; border-radius: 12px; }
        .stat-card:hover { transform: translateY(-5px); }
        .icon-circle { width: 50px; height: 50px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 24px; margin-bottom: 10px; }
        .chart-container { position: relative; height: 350px; width: 100%; }
    </style>
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
                        <li class="nav-item"><a class="nav-link" href="UserTicket.aspx">User Ticket</a></li>
                        <li class="nav-item"><a class="nav-link" href="TheatreCityHallMovie.aspx">Theatre Report</a></li>
                        <li class="nav-item"><a class="nav-link" href="MovieOccupancy.aspx">Occupancy</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <h2 class="mb-4 fw-bold">Dashboard Summary</h2>

            <div class="row g-3 mb-4">
                <div class="col-md-2 col-sm-6">
                    <div class="card stat-card shadow-sm h-100 text-center p-3 border-start border-primary border-4">
                        <div class="icon-circle bg-primary bg-opacity-10 text-primary mx-auto">🎬</div>
                        <h3 class="fw-bold mb-0"><asp:Label ID="lblMovies" runat="server" /></h3>
                        <small class="text-muted text-uppercase fw-bold small">Movies</small>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6">
                    <div class="card stat-card shadow-sm h-100 text-center p-3 border-start border-success border-4">
                        <div class="icon-circle bg-success bg-opacity-10 text-success mx-auto">👤</div>
                        <h3 class="fw-bold mb-0"><asp:Label ID="lblCustomers" runat="server" /></h3>
                        <small class="text-muted text-uppercase fw-bold small">Customers</small>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <div class="card stat-card shadow-sm h-100 text-center p-3 border-start border-warning border-4">
                        <div class="icon-circle bg-warning bg-opacity-10 text-warning mx-auto">💰</div>
                        <h3 class="fw-bold mb-0">Rs. <asp:Label ID="lblRevenue" runat="server" Text="0" /></h3>
                        <small class="text-muted text-uppercase fw-bold small">Total Sales (Till Date)</small>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6">
                    <div class="card stat-card shadow-sm h-100 text-center p-3 border-start border-info border-4">
                        <div class="icon-circle bg-info bg-opacity-10 text-info mx-auto">📅</div>
                        <h3 class="fw-bold mb-0"><asp:Label ID="lblShows" runat="server" /></h3>
                        <small class="text-muted text-uppercase fw-bold small">Shows</small>
                    </div>
                </div>
                <div class="col-md-2 col-sm-6">
                    <div class="card stat-card shadow-sm h-100 text-center p-3 border-start border-danger border-4">
                        <div class="icon-circle bg-danger bg-opacity-10 text-danger mx-auto">🏛️</div>
                        <h3 class="fw-bold mb-0"><asp:Label ID="lblHalls" runat="server" /></h3>
                        <small class="text-muted text-uppercase fw-bold small">Halls</small>
                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-12">
                    <div class="card shadow-sm border-0">
                        <div class="card-header bg-white py-3">
                            <h5 class="mb-0 fw-bold">🎟️ Ticket Booking Status Breakdown</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="salesChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card shadow-sm border-0 mb-5">
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold">🎬 Latest Movies</h5>
                    <a href="Movie.aspx" class="btn btn-sm btn-outline-primary">View All</a>
                </div>
                <div class="table-responsive">
                    <asp:GridView ID="gvMovies" runat="server" DataSourceID="sdsMovies" AutoGenerateColumns="false" CssClass="table table-hover align-middle mb-0" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Title" ItemStyle-CssClass="fw-bold text-dark" />
                            <asp:BoundField DataField="MOVIE_GENRE" HeaderText="Genre" />
                            <asp:BoundField DataField="MOVIE_LANGUAGE" HeaderText="Language" />
                            <asp:BoundField DataField="RELEASE_DATE" HeaderText="Release Date" DataFormatString="{0:dd-MMM-yyyy}" />
                        </Columns>
                        <HeaderStyle CssClass="table-light text-muted small text-uppercase" />
                    </asp:GridView>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="sdsM" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL FROM MOVIE" />
        <asp:SqlDataSource ID="sdsC" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL FROM CUSTOMER" />
        <asp:SqlDataSource ID="sdsS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL FROM SHOWS" />
        <asp:SqlDataSource ID="sdsH" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TOTAL FROM HALL" />
        <asp:SqlDataSource ID="sdsMovies" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM MOVIE ORDER BY Release_Date DESC" />
        
        <asp:SqlDataSource ID="sdsTicketStats" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT BOOKING_STATUS, COUNT(*) AS TOTAL_COUNT, SUM(TICKET_PRICE) AS TOTAL_VAL FROM TICKET GROUP BY BOOKING_STATUS" />

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script runat="server">
        public string ChartLabels = "";
        public string ChartValues = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                // Load counts
                System.Data.DataView dm = (System.Data.DataView)sdsM.Select(DataSourceSelectArguments.Empty);
                System.Data.DataView dc = (System.Data.DataView)sdsC.Select(DataSourceSelectArguments.Empty);
                System.Data.DataView ds = (System.Data.DataView)sdsS.Select(DataSourceSelectArguments.Empty);
                System.Data.DataView dh = (System.Data.DataView)sdsH.Select(DataSourceSelectArguments.Empty);

                lblMovies.Text = dm[0]["TOTAL"].ToString();
                lblCustomers.Text = dc[0]["TOTAL"].ToString();
                lblShows.Text = ds[0]["TOTAL"].ToString();
                lblHalls.Text = dh[0]["TOTAL"].ToString();

                // Load Graph & Revenue
                System.Data.DataView dvT = (System.Data.DataView)sdsTicketStats.Select(DataSourceSelectArguments.Empty);
                decimal totalRev = 0;

                for (int i = 0; i < dvT.Table.Rows.Count; i++)
                {
                    ChartLabels += "'" + dvT.Table.Rows[i]["BOOKING_STATUS"].ToString().Trim() + "',";
                    ChartValues += dvT.Table.Rows[i]["TOTAL_COUNT"].ToString() + ",";
                    
                    if (dvT.Table.Rows[i]["TOTAL_VAL"] != DBNull.Value)
                        totalRev += Convert.ToDecimal(dvT.Table.Rows[i]["TOTAL_VAL"]);
                }

                lblRevenue.Text = totalRev.ToString("N0");
                ChartLabels = ChartLabels.TrimEnd(',');
                ChartValues = ChartValues.TrimEnd(',');
            } catch {
                ChartLabels = "'No Data'";
                ChartValues = "0";
            }
        }
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const ctx = document.getElementById('salesChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: [<%= ChartLabels %>],
                    datasets: [{
                        label: 'Tickets',
                        data: [<%= ChartValues %>],
                        backgroundColor: '#0d6efd',
                        borderRadius: 8
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: false } },
                    scales: { y: { beginAtZero: true } }
                }
            });
        });
    </script>
</body>
</html>