jQuery(function(){
    function  StoryCafe(){
        var $this = this;
        $this.situations = [
                             [ "#new_story"        ,[  [ "ajax:beforeSend"  , {callback:function(){
                                                                               //    alert("故事不能为空！")
                                                                               }}
                                                        ],
                                                        ["ajax:success", {callback:function(event,data,status, xhr){
                                                                                var $o = $(".block-stories-new .content");
                                                                                   $o.length>0 ? $o : $o = $(".block-stories-new");
                                                                                   $o.append(data);
                                                                              }}
                                                        ],
                                                        ["ajax:error"       , { callback:function(){
                                                                                 alert("网络错误，稍后再试！")
                                                                              }}
                                                        ]
                                                     ]
                              ],
                              [ "#new_project"      ,[  [ "ajax:beforeSend"  , {callback:function(){
                                                                                  confirm("确定要添加此项目？")
                                                                               }}
                                                        ],
                                                        ["ajax:success"     , { callback:function(){
                                                                                  alert("create project successlly");
                                                                              }}
                                                        ],
                                                        ["ajax:error"       , { callback:function(){
                                                                                 alert("网络错误，稍后再试！")
                                                                              }}
                                                        ]
                                                     ]
                              ],
                              [ "#description_content",[  [ "ajax:beforeSend" , {callback:function(){
                                                                                    if(!$("#description-areatext").val()) return;
                                                                                }}
                                                           ],
                                                           ["ajax:success"    , { callback:function(){
                                                                                }}
                                                           ],
                                                           ["ajax:error"      , { callback:function(){
                                                                                  alert("description自动保存失败，稍后再试！")
                                                                                }}
                                                           ]
                                                        ]
                              ],
                              [ "#new_group"         , [  [ "ajax:beforeSend" , {callback:function(){
                                                                                  }}
                                                          ],
                                                          ["ajax:success"     , { callback:function(data){
                                                                                   $('#myModal').modal('hide');
                                                                                   $("#group_list").append(data);
                                                                                  }}
                                                          ],
                                                          ["ajax:error"       , { callback:function(){
                                                                                  alert("网络错误，稍后再试！")
                                                                                }}
                                                          ]
                                                       ]
                              ],
                              [ "#description-areatext",[  [ "blur"           , {callback:function(){
                                                                                   $("#description_content").submit();
                                                                                }}
                                                           ]
                                                        ]
                              ],
                              [ ".change_status_icon" , [  [ "ajax:beforeSend" , {callback:function(){

                                                                                  }}
                                                          ],
                                                           ["ajax:success"     , { callback:function(event,data,status, xhr){
                                                                                   $(this).parents("tr").remove();
                                                                                   var    $o=  $(".block-stories-"+$(this).attr("attr_next_status")+" table");
                                                                                   $o.length>0 ? $o : $o= $(".block-stories-"+$(this).attr("attr_next_status"));
                                                                                   $o.append(data);
                                                                                }}
                                                          ],
                                                          ["ajax:error"       , { callback:function(){
                                                                                  alert("网络错误，稍后再试！")
                                                                                }}
                                                          ]
                                                       ]
                              ]
        /*    ,
                              [ "span[class~=icon-arrow-up]" , [  [ "click"    , {callback:function(){
                                                                                    $this.init_animats("close_nav");
                                                                                  }}
                                                          ]
                                                       ]
                              ],
                              [ "span[class~=icon-arrow-left]" , [  [ "click"    , {callback:function(){
                                                                                    $this.init_animats("close_side_left");
                                                                                  }}
                                                          ]
                                                       ]
                              ]*/
                            ]  ;
      $this.init_event= function(){
            for( var i =0 ;i<$this.situations.length ;i++){
                for(var j =0 ;j<$this.situations[i][1].length ;j++){
                    $($this.situations[i][0]).live($this.situations[i][1][j][0] ,$this.situations[i][1][j][1].callback) ;
                }

            }
        }
      $this.init_layout= function(){
             var document_height = $(window).height()-$(".navbar-inverse").height();
             var block_content_width = $("div[class~=slide-right]").width();
             $("div[class~=slide-left]").children("div[class|=side]").css("height", document_height/2);
            $("div[class^=block] .content").css("width", block_content_width/3).css("height", document_height/2);
      }
      $this.init_animats=function(){

          $("span[class~=icon-arrow-up]").toggle(function(){
              $this.animats.nav_animat.hide();

          }, function(){
              $this.animats.nav_animat.show();
          });

         $("span[class~=icon-arrow-left]").toggle(
               function(){
                   $this.animats.layout_animat.animateL(0).animateR( $(window).width() ).animate_nav_color("#666").layout_nav();
               },
               function(){
                   $this.animats.layout_animat.animateL(186).animateR(1625).animate_nav_color("#333").layout_nav();
               });
      }
      $this.animats={
          nav_animat:{
              hide: function(){
                   $this.animats.nav_animat.layout_nav();
                  $(".navbar").animate({opacity: "hide"}, {duration: 1000});

                   return $this.animats.nav_animat ;
              },
              show:function(){

                  $(".navbar").animate({opacity: "show"}, {duration: 1000});
                    $this.animats.nav_animat.layout_nav();
                   return $this.animats.nav_animat ;
              },
             layout_nav :function(){
                 if( $(".navbar").css("display")=="block"){
                     $("body").prepend("<div class='animat-nav'>"+$('div[class=btn-group-vertical]').html()+"</div>");
                       storycafe.init_animats();
                 }else{
                     $("div[class=animat-nav]").remove()
                 }
             }
          },
          layout_animat:{
              animateL :function(width){
                 $(".slide-left").animate({ "width": width }, {duration: 1000});
                 return $this.animats.layout_animat ;
             },
             animateR : function(num){
                         $(".slide-right")
                         .queue("fader", function(next) {
                            $("div[class~=span10]").animate({ width :num},{duration: 1000, queue: false});
                            next();
                          })
                     .dequeue("fader");
                  return $this.animats.layout_animat ;
             },
             animate_nav_color: function(color){
                       $(".nav")
                       .queue("color", function(next) {
                          $("div[class^=block] .nav").animate({"background":color},{duration: 1000, queue: false});
                          next();
                        })
                     .dequeue("color");
                  return $this.animats.layout_animat ;
             }


          }
      }

    }


    var storycafe = new StoryCafe();
    storycafe.init_event();
    storycafe.init_layout();
    storycafe.init_animats();
    setInterval(eval("storycafe.init_layout"),1);
});
