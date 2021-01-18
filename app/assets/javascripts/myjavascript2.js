  function categoryIssues(id) {
    var category_list = document.getElementById(id);
    var category = category_list.options[category_list.selectedIndex].text;
    if (category != ' ') {
      //* a category was selected so build the appropriate issue list
      var iss = id.replace("category", "issue");
      var issue = document.getElementById(iss);
      issue.options.length = 0;
      var o = document.createElement("option");
      o.selected = true;
      switch (category) {
        case 'OPERATIONS':
          o.text = 'WRONG ITEM'
          issue.options.add(o, issue.options.length);
          o.selected = false;
          o = document.createElement("option");
          o.text = 'SHORT DATE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LOADING ERROR'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LESS THAN ORDERED'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'MORE THAN ORDERED'
          issue.options.add(o, issue.options.length);
          break;
        case 'PURCHASING':
          o.text = 'LATE DELIVERY'
          issue.options.add(o, issue.options.length);
          o.selected = false;
          o = document.createElement("option");
          o.text = 'MORE THAN ORDER'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LESS THAN ORDER'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'HIGH TEMPERATURE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LOW TEMPERATURE'
          issue.options.add(o, issue.options.length);
          break;
        case 'QUALITY':
          o.text = 'INCORRECT CUT'
          issue.options.add(o, issue.options.length);
          o.selected = false;
          o = document.createElement("option");
          o.text = 'PRODUCT APPEARANCE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'BLOOD SHOT'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'BRUISING'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'BROKEN BONES'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'EXPIRED BEFORE DATE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'EXCESS PURGE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'DISCOLORATION'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'FOREIGN MATERIAL - BONE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'FOREIGN MATERIAL - TUMOR'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'FOREIGN MATERIAL - PELLET'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'FOREIGN MATERIAL - OTHER'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'PACKAGING - LOOSE/BLOWN'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'PACKAGING - LEAK'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'PACKAGING - MISLABLED'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'TEXTURE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'LOT TO LOT VARIATION'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'COOK UP ISSUE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'MARBLING'
          issue.options.add(o, issue.options.length);
          break;
        default:
          o.text = 'CUSTOMER ORDERED WRONG PRODUCT'
          issue.options.add(o, issue.options.length);
          o.selected = false;
          o = document.createElement("option");
          o.text = 'ORDER ENTRY ERROR'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'CUSTOMER ACCOMODATION'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'PRICING ISSUE'
          issue.options.add(o, issue.options.length);
          o = document.createElement("option");
          o.text = 'CREDIT ISSUE'
          issue.options.add(o, issue.options.length);
      }
    }
  }

  function issue1Description(id) {
    //* display description of issue 1 reason
    var issue1 = document.getElementById(id);
    var issue1_value = issue1.value;
    var i = 0;
    if (issue1_value.length == 0 || !issue1_value.trim()) {
      //* if issue1 is now empty set the issue1 description to blank
      var desc = id.replace("issue1", "issue1_description");
      var description = document.getElementById(desc);
      description.value = ' ';
    }
    else {
      //* Use the issue to get the description
      var desc = id.replace("issue1", "issue1_description");
      var description = document.getElementById(desc);
      switch (issue1_value) {
        case 'BUTCHERING':
          description.value = 'Tears, holes, gashes, cuts, improperly fabricated (e.g. tenderloin with chain on when should be removed)';
          break;
        case 'FOREIGN MATERIAL':
          description.value = 'Bone in a boneless, wood, plastic, glass, metal, etc';
          break;
        case 'HANDLING (BRUISING)':
          description.value = 'Product is showing signs animal was mishandled and is therefore bruised';
          break;
        case 'PACKAGING LOOSE/BLOWN/DAMAGED':
          description.value = 'Leaking bags, crushed boxes, blood spill, wet box, etc';
          break;
        case 'PRODUCT SPEC':
          description.value = 'Size, texture, shape, separation, etc';
          break;
        case 'FLAVOR ISSUE':
          description.value = 'Flavor is not what it should be';
          break;
        case 'SHELF LIFE':
          description.value = 'Product is showing signs of spoilage (e.g. smell, turning green, etc) prior to expiration date';
          break;
        case 'TEMPERATURE':
          description.value = 'Product temperature is not as per specification';
          break;
        case 'WRONG ITEM (LABELING)':
          description.value = 'Mislabeled Product from vendor/receiving';
          break;
        case 'SHIPPING':
          description.value = 'FedEx/truck delivery issues or late delivery. Delivered to the wrong address. Invoice not signed';
          break;
        case 'PAYMENT':
          description.value = 'COD issues, freight charged on products set to back order due to no inventory, credit card declined, inaccurate billing (weight/quantity)';
          break;
        case 'PICK & PACK':
          description.value = 'Incorrect qty/product shipped';
          break;
        case 'ORDER ISSUES':
          description.value = 'Customer ordered wrong product, customer cancelled prior to shipping, order entry ISR/CSR, expired CPM/special/promotion';
          break;
        case 'CUSTOMER SERVICE':
          description.value = 'Misbehavior by employee (driver/sales/ISR?CSR/accounts receivables)';
          break;
      }
    }
  }
  function issue2Description(id) {
    //* display description of issue 1 reason
    var issue2 = document.getElementById(id);
    var issue2_value = issue2.value;
    var i = 0;
    if (issue2_value.length == 0 || !issue2_value.trim()) {
      //* if issue1 is now empty set the issue1 description to blank
      var desc = id.replace("issue2", "issue2_description");
      var description = document.getElementById(desc);
      description.value = ' ';
    }
    else {
      //* Use the issue to get the description
      var desc = id.replace("issue2", "issue2_description");
      var description = document.getElementById(desc);
      switch (issue2_value) {
        case 'BUTCHERING':
          description.value = 'Tears, holes, gashes, cuts, improperly fabricated (e.g. tenderloin with chain on when should be removed)';
          break;
        case 'FOREIGN MATERIAL':
          description.value = 'Bone in a boneless, wood, plastic, glass, metal, etc';
          break;
        case 'HANDLING (BRUISING)':
          description.value = 'Product is showing signs animal was mishandled and is therefore bruised';
          break;
        case 'PACKAGING LOOSE/BLOWN/DAMAGED':
          description.value = 'Leaking bags, crushed boxes, blood spill, wet box, etc';
          break;
        case 'PRODUCT SPEC':
          description.value = 'Size, texture, shape, separation, etc';
          break;
        case 'FLAVOR ISSUE':
          description.value = 'Flavor is not what it should be';
          break;
        case 'SHELF LIFE':
          description.value = 'Product is showing signs of spoilage (e.g. smell, turning green, etc) prior to expiration date';
          break;
        case 'TEMPERATURE':
          description.value = 'Product temperature is not as per specification';
          break;
        case 'WRONG ITEM (LABELING)':
          description.value = 'Mislabeled Product from vendor/receiving';
          break;
        case 'SHIPPING':
          description.value = 'FedEx/truck delivery issues or late delivery. Delivered to the wrong address. Invoice not signed';
          break;
        case 'PAYMENT':
          description.value = 'COD issues, freight charged on products set to back order due to no inventory, credit card declined, inaccurate billing (weight/quantity)';
          break;
        case 'PICK & PACK':
          description.value = 'Incorrect qty/product shipped';
          break;
        case 'ORDER ISSUES':
          description.value = 'Customer ordered wrong product, customer cancelled prior to shipping, order entry ISR/CSR, expired CPM/special/promotion';
          break;
        case 'CUSTOMER SERVICE':
          description.value = 'Misbehavior by employee (driver/sales/ISR?CSR/accounts receivables)';
          break;
      }
    }
  }
