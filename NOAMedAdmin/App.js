function showPopup(link, name, _w, _h) {
    popup.SetContentHtml(null);
    popup.SetHeaderText(name);
    popup.SetSize(_w, _h);
    popup.SetContentUrl(link);
    popup.Show();
}
function CloseWindow() {
    popup.SetContentHtml(null);
    popup.Hide();

    pnlBack.PerformCallback('Refresh');
}
function CustomButtonClick(s, e) {
 
    var row = s.GetFocusedRowIndex();
    var rowKeyValue = s.GetRowKey(e.visibleIndex);
    if (e.buttonID == 'btnRemove') {
        pnlBack.PerformCallback('Remove:' + rowKeyValue.toString());
    }
    if (e.buttonID == 'btnApprove') {
        pnlBack.PerformCallback('Approve:' + rowKeyValue.toString());
    }
    else if (e.buttonID == 'btnEditUser') {
        showPopup('AddUser.aspx?ID=' + rowKeyValue, 'USER ADD-EDİT', 500, 240);
    }
    else if (e.buttonID == 'btnEditPage') {
        showPopup('AddPage.aspx?ID=' + rowKeyValue, 'PAGE ADD-EDİT', 800, 640);
    }
    
    else if (e.buttonID == 'btnEditSlider') {
        showPopup('AddSlider.aspx?ID=' + rowKeyValue, 'SLIDER ADD-EDİT', 700, 400);
    }
    
    else if (e.buttonID == 'btnEditBlog') {
        showPopup('AddBlog.aspx?ID=' + rowKeyValue, 'BLOG ADD-EDİT', 800, 720);
    }
    else if (e.buttonID == 'btnEditQuestion') {
        showPopup('AddQuestion.aspx?ID=' + rowKeyValue, 'QUESTION ADD-EDİT', 900, 250);
    } 
    else if (e.buttonID == 'btnEditContent') {
        showPopup('AddContent.aspx?ID=' + rowKeyValue, 'CONTENT ADD-EDİT', 900, 700);
    }     
    else if (e.buttonID == 'btnEditVideo') {
        showPopup('AddVideo.aspx?ID=' + rowKeyValue, 'VİDEO ADD-EDİT', 300, 200);
    }
    else if (e.buttonID == 'btnVoucher') {
        showPopup('VoucherList.aspx?ID=' + rowKeyValue, 'VOUCHER ADD-EDİT', 950, 600);
    }
    else if (e.buttonID == 'btnVoucherAdd') {
        showPopup('Voucher.aspx?ID=' + rowKeyValue, 'VOUCHER ADD-EDİT', 400, 250);
    }    
    else if (e.buttonID == 'btnEditCustomer') {
        showPopup('AddCustomer.aspx?ID=' + rowKeyValue, 'CUSTOMER ADD-EDİT', 700, 500);
    } 

    
}