﻿<%@ Page Title="Личный кабинет" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cabinet.aspx.cs" Inherits="Rentoolo.Account.Cabinet" %>

<%@ Import Namespace="Rentoolo.Model" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="additem">
        <div class="additem-logo">
            <h4><%: Title %></h4>
        </div>
        <div class="additem-category">
            <div class="additem-right additem__way" cid="1001">


                <%--<div>
                    <input type="file" name="avatarka" id="fileInput">

                        <img src="https://www.wallpaperup.com/uploads/wallpapers/2016/05/08/947390/1f2d86bf06762856282747aa5f624fac-1000.jpg">
                        
                        </img>
                    </input>

                    <asp:Button ID="ButtonSaveAvatar" runat="server" Text="set avatar" OnClick="ButtonSaveAvatar_Click" />

                </div>--%>

                <form action="/api/Avatars" method="post" enctype="multipart/form-data">
                    <input type="file" name="uploadedFile" /><br>
                    <input type="submit" value="Загрузить" />
                </form>

                <script type="text/javascript">

                    window.onload = function () {


                        let fileInput = document.getElementById("fileInput");
                        fileInput.onclick = function (e) {
                            console.log(e);

                            let file = e.target.files[0];

                            let reader = new FileReader();
                            reader.readAsArrayBuffer(file);

                            let arr = reader.result;

                            console.log(arr);

                        }

                        fileInput.onchange = function (e) {
                            console.log(e);

                            let file = e.target.files[0];

                            let reader = new FileReader();
                            console.log(e.target.files[0]);

                            reader.readAsArrayBuffer(file);

                            let arr2 = reader.result;

                            console.log(arr2);

                        }

                    }

                </script>


                <table class="marginTable cabinetTable">
                    <tr>
                        <td>Логин:
                        </td>
                        <td><%=User.UserName %></td>
                    </tr>
                    <tr>
                        <td>Баланс: &nbsp; 
                        </td>
                        <td><%if (UserWalletRURT != null)
                                { %><%=UserWalletRURT.Value.ToString("N2") %><%}
                                                                                 else
                                                                                 {%>0<%} %>р. <a href="/Account/CashIn" title="Пополнить">Пополнить</a>
                        </td>
                    </tr>
                </table>
                <div style="padding-top: 15px;">
                    <a href="MyAdverts.aspx" class="button-changePassword settingButton">Мои объявления</a>
                </div>
                <div style="padding-top: 15px;">
                    <a href="MyAdverts.aspx" class="button-changePassword settingButton">Вы смотрели</a>
                </div>
                <div style="padding-top: 15px;">
                    <a href="Settings.aspx" class="button-changePassword settingButton">Настройки</a>
                </div>
                <div style="padding-top: 15px;">
                    <a href="Manage.aspx" class="button-changePassword settingButton">Сменить пароль</a>
                </div>
                <div style="padding-top: 15px;">
                    <a href="LoginStatistics.aspx" class="button-changePassword settingButton">Статистика входов</a>
                </div>
                <div style="padding-top: 15px;">
                    <a href="/Account/CashOut.aspx" class="button-changePassword settingButton">Вывод средств</a>
                </div>
                <div style="padding-top: 15px;">
                    <a href="/Tokens.aspx" class="button-changePassword settingButton">Токены</a>
                </div>
                <div style="padding-top: 15px;">
                    <a href="/Account/TokensBuying.aspx" class="button-changePassword settingButton">История покупок токенов</a>
                </div>
                <div style="padding-top: 15px;">
                    <a href="/Account/TokensSelling.aspx" class="button-changePassword settingButton">История продаж токенов</a>
                </div>
                <% if (Page.User.IsInRole("Administrator"))
                    { %>
                <div style="padding-top: 15px;">
                    <a href="/Admin/Admin.aspx" class="button-changePassword settingButton">Управление</a>
                </div>
                <% } %>
                <div style="padding-top: 15px;">
                    Реферальная ссылка:
                    <br />
                    <input id="refferalLink" class="refferalLink" onclick="copyToClipboardUrl()" type="text" title="Скопировать" value="<%=Helper.GetRefferalLink(Request, this.User.PublicId) %>" />
                </div>
                <hr />
                <div style="padding-top: 15px;">
                    <a href="/Account/DeviceSettings.aspx" class="button-changePassword settingButton">Device Settings</a>
                </div>

                <div>
                    Текущая ссылка на профиль:



                    Уникальная ссылка на профиль пользователя ( <%= User.UniqueUserName %> ):
                    <input type="text" name="uniqueName" />

                    <asp:Button ID="ButtonSetUniqName" runat="server" CssClass="btn btn-secondary align-self-stretch" Text="Set name" OnClick="ButtonSetUniqName_Click" />


                    <br />

                    Выбранный город:<%-- <%=// User.SelectedCity %>--%>
                    <input name="selectedCity" type="text" list="cities" />

                    <datalist id="cities">
                        <% foreach (var city in AllCities)
                            { %>

                        <option>
                            <%=city %>
                        </option>

                        <%} %>
                    </datalist>

                    <asp:Button ID="ButtonCity" runat="server" Text="выбрать город" OnClick="ButtonCity_Click" />



                </div>


                <div>
                    Дата рождения: <%= User.BirthDay %>
                    <input name="birthDay" type="date" />
                    <asp:Button ID="ButtonBirthDay" runat="server" Text="установить другую дату рождения" OnClick="ButtonBirthDay_Click" />




                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">

        function copyToClipboardUrl() {
            var copyText = document.getElementById("refferalLink");
            copyText.select();
            document.execCommand("copy");
        }

        function copyToClipboardAccountId() {
            var copyText = document.getElementById("accountId");
            copyText.select();
            document.execCommand("copy");
        }
    </script>
</asp:Content>
