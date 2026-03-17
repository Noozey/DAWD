<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="dawdd.Movie" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Management</title>
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
            <h2 class="mb-4 text-primary text-center fw-bold">Movie Management</h2>

            <div class="row g-5">
                
                <div class="col-lg-3">
                    <div class="card shadow border-0">
                        <div class="card-header bg-dark text-white py-3">
                            <h5 class="mb-0 text-center">Movie Details</h5>
                        </div>
                        <div class="card-body">
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" Width="100%">
                                <EditItemTemplate>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">MOVIE ID:</label>
                                        <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' CssClass="form-control bg-light" />
                                    </div>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">TITLE:</label>
                                        <asp:TextBox ID="MOVIE_TITLETextBox" runat="server" Text='<%# Bind("MOVIE_TITLE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">GENRE:</label>
                                        <asp:TextBox ID="MOVIE_GENRETextBox" runat="server" Text='<%# Bind("MOVIE_GENRE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">DURATION:</label>
                                        <asp:TextBox ID="MOVIE_DURATIONTextBox" runat="server" Text='<%# Bind("MOVIE_DURATION") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">LANGUAGE:</label>
                                        <asp:TextBox ID="MOVIE_LANGUAGETextBox" runat="server" Text='<%# Bind("MOVIE_LANGUAGE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">RELEASE DATE:</label>
                                        <asp:TextBox ID="RELEASE_DATETextBox" runat="server" Text='<%# Bind("RELEASE_DATE") %>' CssClass="form-control" placeholder="YYYY-MM-DD" />
                                    </div>
                                    <div class="d-grid gap-2">
                                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update Movie" CssClass="btn btn-success" />
                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                                    </div>
                                </EditItemTemplate>

                                <InsertItemTemplate>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small text-primary">MOVIE ID:</label>
                                        <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' CssClass="form-control border-primary" />
                                    </div>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">TITLE:</label>
                                        <asp:TextBox ID="MOVIE_TITLETextBox" runat="server" Text='<%# Bind("MOVIE_TITLE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">GENRE:</label>
                                        <asp:TextBox ID="MOVIE_GENRETextBox" runat="server" Text='<%# Bind("MOVIE_GENRE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">DURATION:</label>
                                        <asp:TextBox ID="MOVIE_DURATIONTextBox" runat="server" Text='<%# Bind("MOVIE_DURATION") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-2">
                                        <label class="form-label fw-bold small">LANGUAGE:</label>
                                        <asp:TextBox ID="MOVIE_LANGUAGETextBox" runat="server" Text='<%# Bind("MOVIE_LANGUAGE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label fw-bold small">RELEASE DATE:</label>
                                        <asp:TextBox ID="RELEASE_DATETextBox" runat="server" Text='<%# Bind("RELEASE_DATE") %>' CssClass="form-control" />
                                    </div>
                                    <div class="d-grid gap-2">
                                        <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Save Movie" CssClass="btn btn-primary" />
                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-outline-secondary" />
                                    </div>
                                </InsertItemTemplate>

                                <ItemTemplate>
                                    <div class="text-center">
                                        <p class="text-muted">Select a movie to edit or click below:</p>
                                        <asp:LinkButton ID="NewButton" runat="server" CommandName="New" Text="+ Add New Movie" CssClass="btn btn-dark w-100" />
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card shadow border-0">
                        <div class="card-header bg-primary text-white py-3">
                            <h5 class="mb-0">Existing Movies</h5>
                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MOVIEID" 
                                DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover mb-0" GridLines="None" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="EditBtn" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-warning btn-action">Edit</asp:LinkButton>
                                             <asp:LinkButton ID="DelBtn" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger btn-action" OnClientClick="return confirm('Are you sure?');">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="SaveBtn" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success btn-action">Save</asp:LinkButton>
                                            <asp:LinkButton ID="CanBtn" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary btn-action">Cancel</asp:LinkButton>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="MOVIE_TITLE" HeaderText="TITLE" SortExpression="MOVIE_TITLE" ItemStyle-CssClass="fw-bold" />
                                    <asp:BoundField DataField="MOVIE_GENRE" HeaderText="GENRE" SortExpression="MOVIE_GENRE" />
                                    <asp:BoundField DataField="MOVIE_DURATION" HeaderText="MINS" SortExpression="MOVIE_DURATION" />
                                    <asp:BoundField DataField="MOVIE_LANGUAGE" HeaderText="LANG" SortExpression="MOVIE_LANGUAGE" />
                                    <asp:BoundField DataField="RELEASE_DATE" HeaderText="RELEASE" SortExpression="RELEASE_DATE" DataFormatString="{0:dd-MMM-yyyy}" />
                                </Columns>
                                <HeaderStyle CssClass="table-dark text-uppercase small" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;MOVIEID&quot;, &quot;MOVIE_TITLE&quot;, &quot;MOVIE_GENRE&quot;, &quot;MOVIE_DURATION&quot;, &quot;MOVIE_LANGUAGE&quot;, &quot;RELEASE_DATE&quot; FROM &quot;MOVIE&quot;"
            InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIEID&quot;, &quot;MOVIE_TITLE&quot;, &quot;MOVIE_GENRE&quot;, &quot;MOVIE_DURATION&quot;, &quot;MOVIE_LANGUAGE&quot;, &quot;RELEASE_DATE&quot;) VALUES (:MOVIEID, :MOVIE_TITLE, :MOVIE_GENRE, :MOVIE_DURATION, :MOVIE_LANGUAGE, :RELEASE_DATE)"
            UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;MOVIE_TITLE&quot; = :MOVIE_TITLE, &quot;MOVIE_GENRE&quot; = :MOVIE_GENRE, &quot;MOVIE_DURATION&quot; = :MOVIE_DURATION, &quot;MOVIE_LANGUAGE&quot; = :MOVIE_LANGUAGE, &quot;RELEASE_DATE&quot; = :RELEASE_DATE WHERE &quot;MOVIEID&quot; = :MOVIEID"
            DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIEID&quot; = :MOVIEID">
            <DeleteParameters><asp:Parameter Name="MOVIEID" Type="String" /></DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MOVIEID" Type="String" /><asp:Parameter Name="MOVIE_TITLE" Type="String" /><asp:Parameter Name="MOVIE_GENRE" Type="String" /><asp:Parameter Name="MOVIE_DURATION" Type="Decimal" /><asp:Parameter Name="MOVIE_LANGUAGE" Type="String" /><asp:Parameter Name="RELEASE_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MOVIE_TITLE" Type="String" /><asp:Parameter Name="MOVIE_GENRE" Type="String" /><asp:Parameter Name="MOVIE_DURATION" Type="Decimal" /><asp:Parameter Name="MOVIE_LANGUAGE" Type="String" /><asp:Parameter Name="RELEASE_DATE" Type="DateTime" /><asp:Parameter Name="MOVIEID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>