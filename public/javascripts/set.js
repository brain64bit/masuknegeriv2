settingMarkitup= {
  markupSet: [
    {name:'Bold', key:'B', openWith:'[b]', closeWith:'[/b]'},
    {name:'Italic', key:'I', openWith:'[i]', closeWith:'[/i]'},
    {name:'Underline', key:'U', openWith:'[u]', closeWith:'[/u]'},
    {name:'Picture', key:'P', replaceWith:'[img][![Url gambar diawali dengan http://:!:http://]!][/img]'},
    {name:'Link', key:'L', openWith:'[url=[![Url diawali dengan http://:!:http://]!]]', closeWith:'[/url]', placeHolder:'Your text to link here...'},
    {name:'Latex', key:'T', openWith:'[tex]', closeWith:'[/tex]'},
    {name:'Code', openWith:'[code]', closeWith:'[/code]'}, 
    {name:'Clean', className:"clean", replaceWith:function(markitup) { return markitup.selection.replace(/\[(.*?)\]/g, "") } }
  ]
}
