//= require jquery
//= require rails-ujs
//= require toastr
//= require_tree .

import "@hotwired/turbo-rails";
import "controllers";

import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

$(document).on("turbo:load", function () {
  changeCategory();
});

function changeCategory() {
  $(".category-dropdown").on("change", function () {
    var categoryName = $(this).val();

    $.ajax({
      url: "/shoppingcart/product_list",
      type: "GET",
      data: { category: categoryName },
      success: function (data) {
        $("#product-list").html(data);
      },
      error: function (xhr, status, error) {
        console.error("AJAX Error: ", status, error);
      },
    });
  });
}
