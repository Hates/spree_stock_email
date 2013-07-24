#SpreeStockEmail

Allow users to create notifications of when products are back in stock.

This extension has no views, you will have to add those yourself sadly. If the current user is logged in then emails will be created based on their current email address, otherwise they are prompted to enter one.

Here is a basic partial:

```erb
<% if spree_current_user %>
  <%= link_to stock_emails_path(stock_email: {product: @product.id}), method: :post do %>
      Notify me
  <% end %>
<% else %>
  <%= form_for :stock_email, url: stock_emails_path do |form| %>
    <%= form.hidden_field :product, value: @product.id %>
    <%= form.label :email, "Your email address" %>
    <%= form.text_field :email %>
    <%= button_tag class: 'button', type: :submit do %>
      Notify me
    <% end %>
  <% end %>
<% end %>
```

##Installation

Add spree_stock_email to your Gemfile:

```ruby
gem 'spree_stock_email'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_stock_email:install
```
