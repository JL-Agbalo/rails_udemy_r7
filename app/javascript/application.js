import "@hotwired/turbo-rails";
import "controllers";
import "jquery";

$(document).on("turbo:load", function () {
  $("#address_details").on("change", function () {
    $(".address-details-div").toggleClass("d-none");
  });
});

import "trix"
import "@rails/actiontext"
