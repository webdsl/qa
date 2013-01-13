module ac

  access control rules
    rule page root(){ true }
    rule page signin(){ true }
    rule page ask(){ true }
    rule page question(*){ true }
    rule page user(*){ true }
    rule ajaxtemplate showContent(t:WikiText){ true }


