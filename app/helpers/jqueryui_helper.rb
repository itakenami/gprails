module JqueryuiHelper

  #-----------------------Helper BOX---------------------------------------------

  def box(opts={},&block)
    str  = ""
    if !opts[:title].blank?
      str << "<div style=\"margin-bottom: 6px\" class=\"ui-grid ui-widget ui-widget-content ui-corner-all\">"
      str << "<div class=\"ui-grid-header ui-widget-header ui-corner-top\">"
      str << capture(&block)
      str << "</div>"
      str << "</div>"
      raw str
    else
      str << "<div style=\"margin-bottom: 6px\">"
      str << "<div>"
      str << capture(&block)
      str << "</div>"
      str << "</div>"
      raw str
    end
  end

  def box_sucess(opts={})
    str = "<div class=\"ui-state-highlight ui-corner-all\" style=\"margin-top: 3px;margin-bottom: 5px; padding: 0 .7em;\">"
    str << "<p>"
    str << "<span class=\"ui-icon ui-icon-info\" style=\"float: left; margin-right: .3em;\"></span>"
    str << opts[:message]
    str << "</p>"
    str << "</div>"
    raw str
  end

  def box_error(opts={}, &block)
    str = "<div class=\"ui-state-error ui-corner-all\" style=\"margin-top: 3px;margin-bottom: 5px; padding: 0 .7em;\">"
    str << "<p>"
    str << "<span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>"
    if !opts[:label].blank?
      str << "<strong>"
      str << opts[:label]
      str << "</strong>"
    end
    str << opts[:message]
    str << "</p>"
    if(block_given?)
      str << capture(&block)
    end
    str << "</div>"
    raw str
  end

  #------------------------------------------------------------------------------

  #-----------------------Helper BUTTON------------------------------------------

  def button_fnc(opts={} )
    str = ""
    str << "$('"<< opts[:obj] << "').button("
    str << "{icons:{primary: '" << opts[:icon] << "'}" unless  opts[:icon].blank?
    str << ",text:false" unless opts[:text]
    str << "});"
    raw str
  end

  def button (opts={})
    str = "<button"
    if !opts[:id].blank?
      str << " id = \"" << opts[:id] << "\" "
    end
    if !opts[:class].blank?
      str << " class = \" " << opts[:class] << " \" "
    end
    if !opts[:onclick].blank?
      str << " type=\"button\" onclick= \""<< opts[:onclick] << "\""
    end

    if !opts[:confirm].blank?
      str << " type=\"button\" onclick=\"jConfirm('"<<opts[:confirm]<<"', 'Confirmação', function(r) {if(r){location.href='"<<opts[:href]<<"';}});\"";
    elsif !opts[:href].blank?
      str << " type=\"button\" onclick=\"location.href='"<< opts[:href] << "'\""
    else
      if opts[:type].equal?("submit")
        str << " type = \"submit\""
      end
    end
    str << ">"
    str << opts[:label]
    str << "</button>"
    raw str
  end

  #------------------------------------------------------------------------------

  #------------------------Helper CONFIRM----------------------------------------

  def confirm_method
    str = "      function confirm_method(dialog, val){
			$(dialog).dialog('option','action_obj' , val );
			$(dialog).dialog('open');
       };"
    raw str
  end

  def confirm_fnc(opts={})
    str ="		$(\"" << opts[:obj] <<"\").dialog({
		    autoOpen: false,
		    width: "<< opts[:width] << ",
		    modal: true,
		    buttons: {
		        \"OK\": function() {
		            $(this).dialog(\"close\");
		            var action = $(this).dialog('option','action_obj');
		            location.href = action;
		        }
		        ,
		        \"Cancelar\": function() {
		            $(this).dialog(\"close\");
		        }
		    }
		});"
    raw str
  end

  def confirm(opts={})
    str = "<div id=\""<<opts[:id]<<"\" title=\"Atençao!\" style=\"display: none;\">"
    str << "<div style=\"font-size: 15px;font-weight: bold; text-align: center;\">"
    str << "<p>"<< opts[:msg] << "</p>"
    str << "</div>"
    str << "</div>"
    raw str
  end

  #------------------------------------------------------------------------------

  #----------------------Helper Date---------------------------------------------

  def date_fnc
    str = "$(\".datepicker\").datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: new Date(2000,01,01),
    dayNamesMin: ['Do', 'Se', 'Te', 'Qu', 'Qi', 'Se', 'Sa'],
    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    showAnim:\"show\"
    });"
    raw str
  end

  #------------------------------------------------------------------------------

  #------------------------Helper GRID-------------------------------------------

  def grid(opts={},&block)
    str = '<div class="ui-grid ui-widget ui-widget-content ui-corner-all">'
    if !opts[:titulo].blank?
      str << '<div class="ui-grid-header ui-widget-header ui-corner-top">'
      str << opts[:titulo]
      str << '</div>'
    end
    str << capture(&block)
    if !opts[:rodape].blank?
      str << '<div class="ui-grid-footer ui-widget-header ui-corner-bottom ui-helper-clearfix">'
      str << '<div class="ui-grid-results">'
      str << opts[:rodape]
      str << '</div>'
    end
    raw str << '</div>'
  end

  def grid_fnc
    str = "$('.ui-grid-content tbody tr').hover(
    function(){ $('td', this).addClass('ui-grid-hover');},
    function(){ $('td', this).removeClass('ui-grid-hover');});"
    raw str
  end

  #------------------------------------------------------------------------------

  #-----------------------Helper TABS--------------------------------------------

  def tab(opts={}, &block)
    str = '<div id="'<< opts[:name] << '">'
    str << '<ul>'
    tabs = opts[:tabs].split(",")
    labels= opts[:labels].split(",")
    size = tabs.length - 1
    puts(opts[:labels].split(","))
    for i in (0 .. size)
      str<< "<li><a href='#"<<tabs[i]<<"'> " << labels[i] << " </a></li>"
    end
    str<<'</ul>'
    str<<capture(tabs, &block)
    str<<'</div>'
    raw str
  end

  def tab_fnc(opts={})
    raw "$('#" << opts[:tabs] << "').tabs();"
  end

  #------------------------------------------------------------------------------

  #----------------------------------HELPER CHECKBOX-----------------------------

  def list_check(opts={}, &block)
    str= ""
    str << "<div style=\""
    if !opts[:width].blank?
      str << "width:"<<opts[:width]<<"px; "
    end
    if !opts[:height].blank?
      str << "height:"<<opts[:height]<<"px; "
    end
    str << " overflow:auto;\" class=\"ui-widget-content ui-corner-all\">"

    for a in opts[:list]
      str << capture(a,&block)
    end

    str << "</div>"
    raw str
  end


  def item_check(opts)
    str = ""
    str << "<div style=\"float: left;height: 20px;\">"
    str << check_box_tag (opts[:name], opts[:id], opts[:checked])
    str << "</div>"
    str << "<div style=\"float: left;height: 13px;padding-top: 9px\">"
    str << opts[:label]
    str << "</div>"
    str << "<br/><br/>"
    raw str
  end

  #------------------------------------------------------------------------------



end