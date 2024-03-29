<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="ShopHoaDB.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="form-inline">
        Chọn danh mục loại:<asp:DropDownList ID="ddloai" runat="server" AutoPostBack="True" CssClass="form-control" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai" >
        </asp:DropDownList>
     
    </div>

    <div class="row">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa" >
            <ItemTemplate>
            <div class="col-md-3">
                <a href="#">
                    <img src="Hinh_San_Pham/<%# Eval("Hinh") %>" style="width:100px" />
                </a> <br />
                
                <%# Eval("TenHoa") %> <br />
                Giá bán:  <%# Eval("Gia", "{0:#,##0} ĐỒNG") %> <br />
            </div>
        </ItemTemplate>
        </asp:Repeater>
        
    </div>
    
    <asp:SqlDataSource ID="dsLoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString4 %>" 
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="dsHoa" runat="server"
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString5 %>"
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>

            <asp:ControlParameter ControlID="ddloai" Name="MaLoai" DefaultValue="1" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
