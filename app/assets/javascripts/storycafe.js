jQuery(function(){
    function  StoryCafe(){
        this.situations = [
                             [ "#new_story"        ,[  [ "ajax:beforeSend"  , {callback:function(){
                                                                                   alert("故事不能为空！")
                                                                               }}
                                                        ],
                                                        ["ajax:success", {callback:function(event,data,status, xhr){
                                                                                 $(".block-stories-new table").append(data);
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
                              [ ".change_status"      , [  [ "ajax:beforeSend" , {callback:function(){
                                                                                  }}
                                                          ],
                                                           ["ajax:success"     , { callback:function(event,data,status, xhr){
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




                            ]  ;
      this.init_event= function(){
            for( var i =0 ;i<this.situations.length ;i++){
                for(var j =0 ;j<this.situations[i][1].length ;j++){
                    $(this.situations[i][0]).bind(this.situations[i][1][j][0] ,this.situations[i][1][j][1].callback) ;
                }

            }
        }

      this.init_layout= function(){



      }


















    /*     this.init_event= function(){
            alert(this.situations);   // 对象
            alert(this.situations.length);  //2
            for( var i =0 ;i<this.situations.length ;i++){

                alert(this.situations[i][0]); // #new_story
                alert(this.situations[i][1]);  // 对象
                alert(this.situations[i][1].length);  //2
                for(var j =0 ;j<this.situations[i][1].length ;j++){
                   alert(this.situations[i][1][j][0]);  // ajax
                   alert(this.situations[i][1][j][1].callback); // 事件
                    $(this.situations[i][0]).bind(this.situations[i][1][j][0] ,this.situations[i][1][j][1].callback) ;
                }

            }
        }*/



    }


    var storycafe = new StoryCafe();
    storycafe.init_event();





});
