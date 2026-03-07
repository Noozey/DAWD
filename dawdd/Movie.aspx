<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="dawdd.Movie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Management</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Movie Management</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" Height="145px" Width="800px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" ReadOnly="True" SortExpression="MOVIEID" />
                <asp:BoundField DataField="MOVIE_TITLE" HeaderText="MOVIE_TITLE" SortExpression="MOVIE_TITLE" />
                <asp:BoundField DataField="MOVIE_GENRE" HeaderText="MOVIE_GENRE" SortExpression="MOVIE_GENRE" />
                <asp:BoundField DataField="MOVIE_DURATION" HeaderText="MOVIE_DURATION" SortExpression="MOVIE_DURATION" />
                <asp:BoundField DataField="MOVIE_LANGUAGE" HeaderText="MOVIE_LANGUAGE" SortExpression="MOVIE_LANGUAGE" />
                <asp:BoundField DataField="RELEASE_DATE" HeaderText="RELEASE_DATE" SortExpression="RELEASE_DATE" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;MOVIEID&quot;, &quot;MOVIE_TITLE&quot;, &quot;MOVIE_GENRE&quot;, &quot;MOVIE_DURATION&quot;, &quot;MOVIE_LANGUAGE&quot;, &quot;RELEASE_DATE&quot; FROM &quot;MOVIE&quot;"
            InsertCommand="INSERT INTO &quot;MOVIE&quot; (&quot;MOVIEID&quot;, &quot;MOVIE_TITLE&quot;, &quot;MOVIE_GENRE&quot;, &quot;MOVIE_DURATION&quot;, &quot;MOVIE_LANGUAGE&quot;, &quot;RELEASE_DATE&quot;) VALUES (:MOVIEID, :MOVIE_TITLE, :MOVIE_GENRE, :MOVIE_DURATION, :MOVIE_LANGUAGE, :RELEASE_DATE)"
            UpdateCommand="UPDATE &quot;MOVIE&quot; SET &quot;MOVIE_TITLE&quot; = :MOVIE_TITLE, &quot;MOVIE_GENRE&quot; = :MOVIE_GENRE, &quot;MOVIE_DURATION&quot; = :MOVIE_DURATION, &quot;MOVIE_LANGUAGE&quot; = :MOVIE_LANGUAGE, &quot;RELEASE_DATE&quot; = :RELEASE_DATE WHERE &quot;MOVIEID&quot; = :MOVIEID"
            DeleteCommand="DELETE FROM &quot;MOVIE&quot; WHERE &quot;MOVIEID&quot; = :MOVIEID">
            <DeleteParameters>
                <asp:Parameter Name="MOVIEID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MOVIEID" Type="String" />
                <asp:Parameter Name="MOVIE_TITLE" Type="String" />
                <asp:Parameter Name="MOVIE_GENRE" Type="String" />
                <asp:Parameter Name="MOVIE_DURATION" Type="Decimal" />
                <asp:Parameter Name="MOVIE_LANGUAGE" Type="String" />
                <asp:Parameter Name="RELEASE_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MOVIE_TITLE" Type="String" />
                <asp:Parameter Name="MOVIE_GENRE" Type="String" />
                <asp:Parameter Name="MOVIE_DURATION" Type="Decimal" />
                <asp:Parameter Name="MOVIE_LANGUAGE" Type="String" />
                <asp:Parameter Name="RELEASE_DATE" Type="DateTime" />
                <asp:Parameter Name="MOVIEID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" Width="300px">
            <EditItemTemplate>
                MOVIEID:
                <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' />
                <br />
                MOVIE_TITLE:
                <asp:TextBox ID="MOVIE_TITLETextBox" runat="server" Text='<%# Bind("MOVIE_TITLE") %>' />
                <br />
                MOVIE_GENRE:
                <asp:TextBox ID="MOVIE_GENRETextBox" runat="server" Text='<%# Bind("MOVIE_GENRE") %>' />
                <br />
                MOVIE_DURATION:
                <asp:TextBox ID="MOVIE_DURATIONTextBox" runat="server" Text='<%# Bind("MOVIE_DURATION") %>' />
                <br />
                MOVIE_LANGUAGE:
                <asp:TextBox ID="MOVIE_LANGUAGETextBox" runat="server" Text='<%# Bind("MOVIE_LANGUAGE") %>' />
                <br />
                RELEASE_DATE:
                <asp:TextBox ID="RELEASE_DATETextBox" runat="server" Text='<%# Bind("RELEASE_DATE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                MOVIEID:
                <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                <br />
                MOVIE_TITLE:
                <asp:TextBox ID="MOVIE_TITLETextBox" runat="server" Text='<%# Bind("MOVIE_TITLE") %>' />
                <br />
                MOVIE_GENRE:
                <asp:TextBox ID="MOVIE_GENRETextBox" runat="server" Text='<%# Bind("MOVIE_GENRE") %>' />
                <br />
                MOVIE_DURATION:
                <asp:TextBox ID="MOVIE_DURATIONTextBox" runat="server" Text='<%# Bind("MOVIE_DURATION") %>' />
                <br />
                MOVIE_LANGUAGE:
                <asp:TextBox ID="MOVIE_LANGUAGETextBox" runat="server" Text='<%# Bind("MOVIE_LANGUAGE") %>' />
                <br />
                RELEASE_DATE:
                <asp:TextBox ID="RELEASE_DATETextBox" runat="server" Text='<%# Bind("RELEASE_DATE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
