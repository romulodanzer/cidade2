//= require active_admin/base
//= require active_admin_datetimepicker


jQuery.datetimepicker.setLocale('pt-BR');

jQuery('#datetimepicker1').datetimepicker({
 i18n:{
  'pt-BR':{
   months:[
    'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho',
    'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
   dayOfWeek:[
    "Dom.", "Seg.", "Ter.", "Qua.",
    "Qui.", "Sex.", "Sab.",
   ]
  }
 },
 timepicker:false,
 format:'d.m.Y'
});

