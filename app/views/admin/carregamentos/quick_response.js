<% if @carregamento.errors.any? %>
   var html = "<%= escape_javascript(render 'error_messages', object: @carregamento) %>";
   $('#quick-add-errors').html(html);
 <% else %>
   window.location.reload();
 <% end %> 