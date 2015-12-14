﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;

public partial class ad_single_province : System.Web.UI.Page
{
    #region Event

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem("--Chọn--"));
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridCommandItem)
        {
            GridCommandItem commandItem = (e.Item as GridCommandItem);
            PlaceHolder container = (PlaceHolder)commandItem.FindControl("PlaceHolder1");
            Label label = new Label();
            label.Text = "&nbsp;&nbsp;";

            container.Controls.Add(label);

            for (int i = 65; i <= 65 + 25; i++)
            {
                LinkButton linkButton1 = new LinkButton();

                LiteralControl lc = new LiteralControl("&nbsp;&nbsp;");

                linkButton1.Text = "" + (char)i;

                linkButton1.CommandName = "alpha";
                linkButton1.CommandArgument = "" + (char)i;

                container.Controls.Add(linkButton1);
                container.Controls.Add(lc);
            }

            LiteralControl lcLast = new LiteralControl("&nbsp;");
            container.Controls.Add(lcLast);

            LinkButton linkButtonAll = new LinkButton();
            linkButtonAll.Text = "Tất cả";
            linkButtonAll.CommandName = "NoFilter";
            container.Controls.Add(linkButtonAll);
        }
        else if (e.Item is GridPagerItem)
        {
            GridPagerItem gridPager = e.Item as GridPagerItem;
            Control numericPagerControl = gridPager.GetNumericPager();

            Control placeHolder = gridPager.FindControl("NumericPagerPlaceHolder");
            placeHolder.Controls.Add(numericPagerControl);
        }
    }

    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "alpha" || e.CommandName == "NoFilter")
        {
            String value = null;
            switch (e.CommandName)
            {
                case ("alpha"):
                    {
                        value = string.Format("{0}%", e.CommandArgument);
                        break;
                    }
                case ("NoFilter"):
                    {
                        value = "%";
                        break;
                    }
            }
            ObjectDataSource1.SelectParameters["ManufacturerName"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string ManufacturerID, Priority, IsAvailable;
            var oManufacturer = new Manufacturer();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ManufacturerID = item.GetDataKeyValue("ManufacturerID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oManufacturer.ManufacturerQuickUpdate(
                    ManufacturerID,
                    IsAvailable,
                    Priority
                    );
            }
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;

            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string ManufacturerNameEn = "";

            if (e.CommandName == "PerformInsert")
            {
                ObjectDataSource1.InsertParameters["IsAvailable"].DefaultValue = strIsAvailable;
                ObjectDataSource1.InsertParameters["ManufacturerNameEn"].DefaultValue = ManufacturerNameEn;
            }
            else
            {
                ObjectDataSource1.UpdateParameters["IsAvailable"].DefaultValue = strIsAvailable;
                ObjectDataSource1.UpdateParameters["ManufacturerNameEn"].DefaultValue = ManufacturerNameEn;
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            var oManufacturer = new Manufacturer();
            string errorList = "", ManufacturerName = "";

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                try
                {
                    var ManufacturerID = item.GetDataKeyValue("ManufacturerID").ToString();
                    ManufacturerName = item["ManufacturerName"].Text;
                    oManufacturer.ManufacturerDelete(ManufacturerID);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                    if (ex.Message == ((int)ErrorNumber.ConstraintConflicted).ToString())
                        errorList += ", " + ManufacturerName;
                }
            }
            if (!string.IsNullOrEmpty(errorList))
            {
                e.Canceled = true;
                string strAlertMessage = "Tỉnh/Thành <b>\"" + errorList.Remove(0, 1).Trim() + " \"</b> đang chứa Quận/Huyện.<br /> Xin xóa Quận/Huyện trong Tỉnh/Thành này hoặc thiết lập hiển thị = \"không\".";
                lblError.Text = strAlertMessage;
            }
        }
    }

    #endregion
}