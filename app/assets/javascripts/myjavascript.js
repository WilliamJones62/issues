  $(document).ready(function() {

    $('#partstab').DataTable({
      scrollY: "30vh",
      scrollCollapse: true,
      paging: false,
      autoWidth: true,
      responsive: true,
      retrieve: true,
      dom: 'Bfrtip',
    });

    $('#listtab').DataTable({
      scrollY: "60vh",
      scrollCollapse: true,
      paging: false,
      autoWidth: true,
      responsive: true,
      retrieve: true,
      dom: 'Bfrtip',
      buttons: [
        {
        extend: 'print',
        }
      ]
    });

    $('#listtab2').DataTable({
      scrollY: "30vh",
      scrollCollapse: true,
      paging: false,
      autoWidth: true,
      responsive: true,
      retrieve: true,
      dom: 'Bfrtip',
      buttons: [
        {
        extend: 'print',
        }
      ]
    });

    $("#btnPrint").printPreview({
      obj2print:'#main'
    });

  });
