class power5::timezone{ 

file{"/etc/localtime":
        ensure=>link,
        target=>"/usr/share/zoneinfo/Asia/Jerusalem",
        force=>"true",
}


}
