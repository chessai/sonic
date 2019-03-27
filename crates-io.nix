{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# aho-corasick-0.6.10

  crates.aho_corasick."0.6.10" = deps: { features?(features_.aho_corasick."0.6.10" deps {}) }: buildRustCrate {
    crateName = "aho-corasick";
    version = "0.6.10";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0bhasxfpmfmz1460chwsx59vdld05axvmk1nbp3sd48xav3d108p";
    libName = "aho_corasick";
    crateBin =
      [{  name = "aho-corasick-dot";  path = "src/main.rs"; }];
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
    ]);
  };
  features_.aho_corasick."0.6.10" = deps: f: updateFeatures f (rec {
    aho_corasick."0.6.10".default = (f.aho_corasick."0.6.10".default or true);
    memchr."${deps.aho_corasick."0.6.10".memchr}".default = true;
  }) [
    (features_.memchr."${deps."aho_corasick"."0.6.10"."memchr"}" deps)
  ];


# end
# ansi_term-0.11.0

  crates.ansi_term."0.11.0" = deps: { features?(features_.ansi_term."0.11.0" deps {}) }: buildRustCrate {
    crateName = "ansi_term";
    version = "0.11.0";
    authors = [ "ogham@bsago.me" "Ryan Scheel (Havvy) <ryan.havvy@gmail.com>" "Josh Triplett <josh@joshtriplett.org>" ];
    sha256 = "08fk0p2xvkqpmz3zlrwnf6l8sj2vngw464rvzspzp31sbgxbwm4v";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."ansi_term"."0.11.0"."winapi"}" deps)
    ]) else []);
  };
  features_.ansi_term."0.11.0" = deps: f: updateFeatures f (rec {
    ansi_term."0.11.0".default = (f.ansi_term."0.11.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.ansi_term."0.11.0".winapi}"."consoleapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."errhandlingapi" = true; }
      { "${deps.ansi_term."0.11.0".winapi}"."processenv" = true; }
      { "${deps.ansi_term."0.11.0".winapi}".default = true; }
    ];
  }) [
    (features_.winapi."${deps."ansi_term"."0.11.0"."winapi"}" deps)
  ];


# end
# arrayvec-0.4.10

  crates.arrayvec."0.4.10" = deps: { features?(features_.arrayvec."0.4.10" deps {}) }: buildRustCrate {
    crateName = "arrayvec";
    version = "0.4.10";
    authors = [ "bluss" ];
    sha256 = "0qbh825i59w5wfdysqdkiwbwkrsy7lgbd4pwbyb8pxx8wc36iny8";
    dependencies = mapFeatures features ([
      (crates."nodrop"."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
    ]);
    features = mkFeatures (features."arrayvec"."0.4.10" or {});
  };
  features_.arrayvec."0.4.10" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "0.4.10".default = (f.arrayvec."0.4.10".default or true); }
      { "0.4.10".serde =
        (f.arrayvec."0.4.10".serde or false) ||
        (f.arrayvec."0.4.10".serde-1 or false) ||
        (arrayvec."0.4.10"."serde-1" or false); }
      { "0.4.10".std =
        (f.arrayvec."0.4.10".std or false) ||
        (f.arrayvec."0.4.10".default or false) ||
        (arrayvec."0.4.10"."default" or false); }
    ];
    nodrop."${deps.arrayvec."0.4.10".nodrop}".default = (f.nodrop."${deps.arrayvec."0.4.10".nodrop}".default or false);
  }) [
    (features_.nodrop."${deps."arrayvec"."0.4.10"."nodrop"}" deps)
  ];


# end
# atty-0.2.11

  crates.atty."0.2.11" = deps: { features?(features_.atty."0.2.11" deps {}) }: buildRustCrate {
    crateName = "atty";
    version = "0.2.11";
    authors = [ "softprops <d.tangren@gmail.com>" ];
    sha256 = "0by1bj2km9jxi4i4g76zzi76fc2rcm9934jpnyrqd95zw344pb20";
    dependencies = (if kernel == "redox" then mapFeatures features ([
      (crates."termion"."${deps."atty"."0.2.11"."termion"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."atty"."0.2.11"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."atty"."0.2.11"."winapi"}" deps)
    ]) else []);
  };
  features_.atty."0.2.11" = deps: f: updateFeatures f (rec {
    atty."0.2.11".default = (f.atty."0.2.11".default or true);
    libc."${deps.atty."0.2.11".libc}".default = (f.libc."${deps.atty."0.2.11".libc}".default or false);
    termion."${deps.atty."0.2.11".termion}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.atty."0.2.11".winapi}"."consoleapi" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwinbase" = true; }
      { "${deps.atty."0.2.11".winapi}"."minwindef" = true; }
      { "${deps.atty."0.2.11".winapi}"."processenv" = true; }
      { "${deps.atty."0.2.11".winapi}"."winbase" = true; }
      { "${deps.atty."0.2.11".winapi}".default = true; }
    ];
  }) [
    (features_.termion."${deps."atty"."0.2.11"."termion"}" deps)
    (features_.libc."${deps."atty"."0.2.11"."libc"}" deps)
    (features_.winapi."${deps."atty"."0.2.11"."winapi"}" deps)
  ];


# end
# autocfg-0.1.2

  crates.autocfg."0.1.2" = deps: { features?(features_.autocfg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "autocfg";
    version = "0.1.2";
    authors = [ "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "0dv81dwnp1al3j4ffz007yrjv4w1c7hw09gnf0xs3icxiw6qqfs3";
  };
  features_.autocfg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."0.1.2".default = (f.autocfg."0.1.2".default or true);
  }) [];


# end
# backtrace-0.3.14

  crates.backtrace."0.3.14" = deps: { features?(features_.backtrace."0.3.14" deps {}) }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.14";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "The Rust Project Developers" ];
    sha256 = "0sp0ib8r5w9sv1g2nkm9yclp16j46yjglw0yhkmh0snf355633mz";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."backtrace"."0.3.14"."cfg_if"}" deps)
      (crates."rustc_demangle"."${deps."backtrace"."0.3.14"."rustc_demangle"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "fuchsia") && !(kernel == "emscripten") && !(kernel == "darwin") && !(kernel == "ios") then mapFeatures features ([
    ]
      ++ (if features.backtrace."0.3.14".backtrace-sys or false then [ (crates.backtrace_sys."${deps."backtrace"."0.3.14".backtrace_sys}" deps) ] else [])) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") || abi == "sgx" then mapFeatures features ([
      (crates."libc"."${deps."backtrace"."0.3.14"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."backtrace"."0.3.14"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."backtrace"."0.3.14"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."backtrace"."0.3.14" or {});
  };
  features_.backtrace."0.3.14" = deps: f: updateFeatures f (rec {
    autocfg."${deps.backtrace."0.3.14".autocfg}".default = true;
    backtrace = fold recursiveUpdate {} [
      { "0.3.14".addr2line =
        (f.backtrace."0.3.14".addr2line or false) ||
        (f.backtrace."0.3.14".gimli-symbolize or false) ||
        (backtrace."0.3.14"."gimli-symbolize" or false); }
      { "0.3.14".backtrace-sys =
        (f.backtrace."0.3.14".backtrace-sys or false) ||
        (f.backtrace."0.3.14".libbacktrace or false) ||
        (backtrace."0.3.14"."libbacktrace" or false); }
      { "0.3.14".coresymbolication =
        (f.backtrace."0.3.14".coresymbolication or false) ||
        (f.backtrace."0.3.14".default or false) ||
        (backtrace."0.3.14"."default" or false); }
      { "0.3.14".dbghelp =
        (f.backtrace."0.3.14".dbghelp or false) ||
        (f.backtrace."0.3.14".default or false) ||
        (backtrace."0.3.14"."default" or false); }
      { "0.3.14".default = (f.backtrace."0.3.14".default or true); }
      { "0.3.14".dladdr =
        (f.backtrace."0.3.14".dladdr or false) ||
        (f.backtrace."0.3.14".default or false) ||
        (backtrace."0.3.14"."default" or false); }
      { "0.3.14".findshlibs =
        (f.backtrace."0.3.14".findshlibs or false) ||
        (f.backtrace."0.3.14".gimli-symbolize or false) ||
        (backtrace."0.3.14"."gimli-symbolize" or false); }
      { "0.3.14".gimli =
        (f.backtrace."0.3.14".gimli or false) ||
        (f.backtrace."0.3.14".gimli-symbolize or false) ||
        (backtrace."0.3.14"."gimli-symbolize" or false); }
      { "0.3.14".libbacktrace =
        (f.backtrace."0.3.14".libbacktrace or false) ||
        (f.backtrace."0.3.14".default or false) ||
        (backtrace."0.3.14"."default" or false); }
      { "0.3.14".libunwind =
        (f.backtrace."0.3.14".libunwind or false) ||
        (f.backtrace."0.3.14".default or false) ||
        (backtrace."0.3.14"."default" or false); }
      { "0.3.14".memmap =
        (f.backtrace."0.3.14".memmap or false) ||
        (f.backtrace."0.3.14".gimli-symbolize or false) ||
        (backtrace."0.3.14"."gimli-symbolize" or false); }
      { "0.3.14".object =
        (f.backtrace."0.3.14".object or false) ||
        (f.backtrace."0.3.14".gimli-symbolize or false) ||
        (backtrace."0.3.14"."gimli-symbolize" or false); }
      { "0.3.14".rustc-serialize =
        (f.backtrace."0.3.14".rustc-serialize or false) ||
        (f.backtrace."0.3.14".serialize-rustc or false) ||
        (backtrace."0.3.14"."serialize-rustc" or false); }
      { "0.3.14".serde =
        (f.backtrace."0.3.14".serde or false) ||
        (f.backtrace."0.3.14".serialize-serde or false) ||
        (backtrace."0.3.14"."serialize-serde" or false); }
      { "0.3.14".serde_derive =
        (f.backtrace."0.3.14".serde_derive or false) ||
        (f.backtrace."0.3.14".serialize-serde or false) ||
        (backtrace."0.3.14"."serialize-serde" or false); }
      { "0.3.14".std =
        (f.backtrace."0.3.14".std or false) ||
        (f.backtrace."0.3.14".default or false) ||
        (backtrace."0.3.14"."default" or false) ||
        (f.backtrace."0.3.14".libbacktrace or false) ||
        (backtrace."0.3.14"."libbacktrace" or false); }
    ];
    backtrace_sys."${deps.backtrace."0.3.14".backtrace_sys}".default = true;
    cfg_if."${deps.backtrace."0.3.14".cfg_if}".default = true;
    libc."${deps.backtrace."0.3.14".libc}".default = (f.libc."${deps.backtrace."0.3.14".libc}".default or false);
    rustc_demangle."${deps.backtrace."0.3.14".rustc_demangle}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.backtrace."0.3.14".winapi}"."dbghelp" = true; }
      { "${deps.backtrace."0.3.14".winapi}"."minwindef" = true; }
      { "${deps.backtrace."0.3.14".winapi}"."processthreadsapi" = true; }
      { "${deps.backtrace."0.3.14".winapi}"."winnt" = true; }
      { "${deps.backtrace."0.3.14".winapi}".default = true; }
    ];
  }) [
    (features_.cfg_if."${deps."backtrace"."0.3.14"."cfg_if"}" deps)
    (features_.rustc_demangle."${deps."backtrace"."0.3.14"."rustc_demangle"}" deps)
    (features_.autocfg."${deps."backtrace"."0.3.14"."autocfg"}" deps)
    (features_.backtrace_sys."${deps."backtrace"."0.3.14"."backtrace_sys"}" deps)
    (features_.libc."${deps."backtrace"."0.3.14"."libc"}" deps)
    (features_.winapi."${deps."backtrace"."0.3.14"."winapi"}" deps)
  ];


# end
# backtrace-sys-0.1.28

  crates.backtrace_sys."0.1.28" = deps: { features?(features_.backtrace_sys."0.1.28" deps {}) }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.28";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1bbw8chs0wskxwzz7f3yy7mjqhyqj8lslq8pcjw1rbd2g23c34xl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
    ]);
  };
  features_.backtrace_sys."0.1.28" = deps: f: updateFeatures f (rec {
    backtrace_sys."0.1.28".default = (f.backtrace_sys."0.1.28".default or true);
    cc."${deps.backtrace_sys."0.1.28".cc}".default = true;
    libc."${deps.backtrace_sys."0.1.28".libc}".default = (f.libc."${deps.backtrace_sys."0.1.28".libc}".default or false);
  }) [
    (features_.libc."${deps."backtrace_sys"."0.1.28"."libc"}" deps)
    (features_.cc."${deps."backtrace_sys"."0.1.28"."cc"}" deps)
  ];


# end
# bindgen-0.47.3

  crates.bindgen."0.47.3" = deps: { features?(features_.bindgen."0.47.3" deps {}) }: buildRustCrate {
    crateName = "bindgen";
    version = "0.47.3";
    authors = [ "Jyun-Yan You <jyyou.tw@gmail.com>" "Emilio Cobos Álvarez <emilio@crisal.io>" "Nick Fitzgerald <fitzgen@gmail.com>" "The Servo project developers" ];
    sha256 = "02wqfi2jvljrp8hycjpa1j0xrllvki8dhyrvfafx959pmvlzdh48";
    libPath = "src/lib.rs";
    crateBin =
      [{  name = "bindgen";  path = "src/main.rs"; }];
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."bindgen"."0.47.3"."bitflags"}" deps)
      (crates."cexpr"."${deps."bindgen"."0.47.3"."cexpr"}" deps)
      (crates."cfg_if"."${deps."bindgen"."0.47.3"."cfg_if"}" deps)
      (crates."clang_sys"."${deps."bindgen"."0.47.3"."clang_sys"}" deps)
      (crates."clap"."${deps."bindgen"."0.47.3"."clap"}" deps)
      (crates."hashbrown"."${deps."bindgen"."0.47.3"."hashbrown"}" deps)
      (crates."lazy_static"."${deps."bindgen"."0.47.3"."lazy_static"}" deps)
      (crates."peeking_take_while"."${deps."bindgen"."0.47.3"."peeking_take_while"}" deps)
      (crates."proc_macro2"."${deps."bindgen"."0.47.3"."proc_macro2"}" deps)
      (crates."quote"."${deps."bindgen"."0.47.3"."quote"}" deps)
      (crates."regex"."${deps."bindgen"."0.47.3"."regex"}" deps)
      (crates."which"."${deps."bindgen"."0.47.3"."which"}" deps)
    ]
      ++ (if features.bindgen."0.47.3".env_logger or false then [ (crates.env_logger."${deps."bindgen"."0.47.3".env_logger}" deps) ] else [])
      ++ (if features.bindgen."0.47.3".log or false then [ (crates.log."${deps."bindgen"."0.47.3".log}" deps) ] else []));
    features = mkFeatures (features."bindgen"."0.47.3" or {});
  };
  features_.bindgen."0.47.3" = deps: f: updateFeatures f (rec {
    bindgen = fold recursiveUpdate {} [
      { "0.47.3".default = (f.bindgen."0.47.3".default or true); }
      { "0.47.3".env_logger =
        (f.bindgen."0.47.3".env_logger or false) ||
        (f.bindgen."0.47.3".logging or false) ||
        (bindgen."0.47.3"."logging" or false); }
      { "0.47.3".log =
        (f.bindgen."0.47.3".log or false) ||
        (f.bindgen."0.47.3".logging or false) ||
        (bindgen."0.47.3"."logging" or false); }
      { "0.47.3".logging =
        (f.bindgen."0.47.3".logging or false) ||
        (f.bindgen."0.47.3".default or false) ||
        (bindgen."0.47.3"."default" or false); }
    ];
    bitflags."${deps.bindgen."0.47.3".bitflags}".default = true;
    cexpr."${deps.bindgen."0.47.3".cexpr}".default = true;
    cfg_if."${deps.bindgen."0.47.3".cfg_if}".default = true;
    clang_sys = fold recursiveUpdate {} [
      { "${deps.bindgen."0.47.3".clang_sys}"."clang_6_0" = true; }
      { "${deps.bindgen."0.47.3".clang_sys}"."runtime" = true; }
      { "${deps.bindgen."0.47.3".clang_sys}".default = true; }
    ];
    clap."${deps.bindgen."0.47.3".clap}".default = true;
    env_logger."${deps.bindgen."0.47.3".env_logger}".default = true;
    hashbrown."${deps.bindgen."0.47.3".hashbrown}".default = true;
    lazy_static."${deps.bindgen."0.47.3".lazy_static}".default = true;
    log."${deps.bindgen."0.47.3".log}".default = true;
    peeking_take_while."${deps.bindgen."0.47.3".peeking_take_while}".default = true;
    proc_macro2."${deps.bindgen."0.47.3".proc_macro2}".default = (f.proc_macro2."${deps.bindgen."0.47.3".proc_macro2}".default or false);
    quote."${deps.bindgen."0.47.3".quote}".default = (f.quote."${deps.bindgen."0.47.3".quote}".default or false);
    regex."${deps.bindgen."0.47.3".regex}".default = true;
    which."${deps.bindgen."0.47.3".which}".default = true;
  }) [
    (features_.bitflags."${deps."bindgen"."0.47.3"."bitflags"}" deps)
    (features_.cexpr."${deps."bindgen"."0.47.3"."cexpr"}" deps)
    (features_.cfg_if."${deps."bindgen"."0.47.3"."cfg_if"}" deps)
    (features_.clang_sys."${deps."bindgen"."0.47.3"."clang_sys"}" deps)
    (features_.clap."${deps."bindgen"."0.47.3"."clap"}" deps)
    (features_.env_logger."${deps."bindgen"."0.47.3"."env_logger"}" deps)
    (features_.hashbrown."${deps."bindgen"."0.47.3"."hashbrown"}" deps)
    (features_.lazy_static."${deps."bindgen"."0.47.3"."lazy_static"}" deps)
    (features_.log."${deps."bindgen"."0.47.3"."log"}" deps)
    (features_.peeking_take_while."${deps."bindgen"."0.47.3"."peeking_take_while"}" deps)
    (features_.proc_macro2."${deps."bindgen"."0.47.3"."proc_macro2"}" deps)
    (features_.quote."${deps."bindgen"."0.47.3"."quote"}" deps)
    (features_.regex."${deps."bindgen"."0.47.3"."regex"}" deps)
    (features_.which."${deps."bindgen"."0.47.3"."which"}" deps)
  ];


# end
# bitflags-0.4.0

  crates.bitflags."0.4.0" = deps: { features?(features_.bitflags."0.4.0" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "0.4.0";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0an03kibhfcc0mcxf6a0mvbab0s7cggnvflw8jn0b15i351h828c";
    features = mkFeatures (features."bitflags"."0.4.0" or {});
  };
  features_.bitflags."0.4.0" = deps: f: updateFeatures f (rec {
    bitflags."0.4.0".default = (f.bitflags."0.4.0".default or true);
  }) [];


# end
# bitflags-1.0.4

  crates.bitflags."1.0.4" = deps: { features?(features_.bitflags."1.0.4" deps {}) }: buildRustCrate {
    crateName = "bitflags";
    version = "1.0.4";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1g1wmz2001qmfrd37dnd5qiss5njrw26aywmg6yhkmkbyrhjxb08";
    features = mkFeatures (features."bitflags"."1.0.4" or {});
  };
  features_.bitflags."1.0.4" = deps: f: updateFeatures f (rec {
    bitflags."1.0.4".default = (f.bitflags."1.0.4".default or true);
  }) [];


# end
# byteorder-1.3.1

  crates.byteorder."1.3.1" = deps: { features?(features_.byteorder."1.3.1" deps {}) }: buildRustCrate {
    crateName = "byteorder";
    version = "1.3.1";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1dd46l7fvmxfq90kh6ip1ghsxzzcdybac8f0mh2jivsdv9vy8k4w";
    build = "build.rs";
    features = mkFeatures (features."byteorder"."1.3.1" or {});
  };
  features_.byteorder."1.3.1" = deps: f: updateFeatures f (rec {
    byteorder = fold recursiveUpdate {} [
      { "1.3.1".default = (f.byteorder."1.3.1".default or true); }
      { "1.3.1".std =
        (f.byteorder."1.3.1".std or false) ||
        (f.byteorder."1.3.1".default or false) ||
        (byteorder."1.3.1"."default" or false); }
    ];
  }) [];


# end
# cc-1.0.32

  crates.cc."1.0.32" = deps: { features?(features_.cc."1.0.32" deps {}) }: buildRustCrate {
    crateName = "cc";
    version = "1.0.32";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0mq4ma94yis74dnn98w2wkaad195dr6qwlma4fs590xiv0j15ldx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cc."1.0.32".rayon or false then [ (crates.rayon."${deps."cc"."1.0.32".rayon}" deps) ] else []));
    features = mkFeatures (features."cc"."1.0.32" or {});
  };
  features_.cc."1.0.32" = deps: f: updateFeatures f (rec {
    cc = fold recursiveUpdate {} [
      { "1.0.32".default = (f.cc."1.0.32".default or true); }
      { "1.0.32".rayon =
        (f.cc."1.0.32".rayon or false) ||
        (f.cc."1.0.32".parallel or false) ||
        (cc."1.0.32"."parallel" or false); }
    ];
    rayon."${deps.cc."1.0.32".rayon}".default = true;
  }) [
    (features_.rayon."${deps."cc"."1.0.32"."rayon"}" deps)
  ];


# end
# cexpr-0.3.5

  crates.cexpr."0.3.5" = deps: { features?(features_.cexpr."0.3.5" deps {}) }: buildRustCrate {
    crateName = "cexpr";
    version = "0.3.5";
    authors = [ "Jethro Beekman <jethro@jbeekman.nl>" ];
    sha256 = "1aianwjm81d0k23aam5wpj1gzjild6wqq8qbkyjhd5qvrxz5z18p";
    dependencies = mapFeatures features ([
      (crates."nom"."${deps."cexpr"."0.3.5"."nom"}" deps)
    ]);
  };
  features_.cexpr."0.3.5" = deps: f: updateFeatures f (rec {
    cexpr."0.3.5".default = (f.cexpr."0.3.5".default or true);
    nom = fold recursiveUpdate {} [
      { "${deps.cexpr."0.3.5".nom}"."verbose-errors" = true; }
      { "${deps.cexpr."0.3.5".nom}".default = true; }
    ];
  }) [
    (features_.nom."${deps."cexpr"."0.3.5"."nom"}" deps)
  ];


# end
# cfg-if-0.1.7

  crates.cfg_if."0.1.7" = deps: { features?(features_.cfg_if."0.1.7" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.7";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13gvcx1dxjq4mpmpj26hpg3yc97qffkx2zi58ykr1dwr8q2biiig";
  };
  features_.cfg_if."0.1.7" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.7".default = (f.cfg_if."0.1.7".default or true);
  }) [];


# end
# clang-sys-0.26.4

  crates.clang_sys."0.26.4" = deps: { features?(features_.clang_sys."0.26.4" deps {}) }: buildRustCrate {
    crateName = "clang-sys";
    version = "0.26.4";
    authors = [ "Kyle Mayes <kyle@mayeses.com>" ];
    sha256 = "097hhblr4yhkj22i5zjc635mmqp3vfz1jbrsv4nc061ws1nz4brx";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."glob"."${deps."clang_sys"."0.26.4"."glob"}" deps)
      (crates."libc"."${deps."clang_sys"."0.26.4"."libc"}" deps)
    ]
      ++ (if features.clang_sys."0.26.4".libloading or false then [ (crates.libloading."${deps."clang_sys"."0.26.4".libloading}" deps) ] else []));

    buildDependencies = mapFeatures features ([
      (crates."glob"."${deps."clang_sys"."0.26.4"."glob"}" deps)
    ]);
    features = mkFeatures (features."clang_sys"."0.26.4" or {});
  };
  features_.clang_sys."0.26.4" = deps: f: updateFeatures f (rec {
    clang_sys = fold recursiveUpdate {} [
      { "0.26.4".default = (f.clang_sys."0.26.4".default or true); }
      { "0.26.4".gte_clang_3_6 =
        (f.clang_sys."0.26.4".gte_clang_3_6 or false) ||
        (f.clang_sys."0.26.4".clang_3_6 or false) ||
        (clang_sys."0.26.4"."clang_3_6" or false) ||
        (f.clang_sys."0.26.4".clang_3_7 or false) ||
        (clang_sys."0.26.4"."clang_3_7" or false) ||
        (f.clang_sys."0.26.4".clang_3_8 or false) ||
        (clang_sys."0.26.4"."clang_3_8" or false) ||
        (f.clang_sys."0.26.4".clang_3_9 or false) ||
        (clang_sys."0.26.4"."clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4".gte_clang_3_7 =
        (f.clang_sys."0.26.4".gte_clang_3_7 or false) ||
        (f.clang_sys."0.26.4".clang_3_7 or false) ||
        (clang_sys."0.26.4"."clang_3_7" or false) ||
        (f.clang_sys."0.26.4".clang_3_8 or false) ||
        (clang_sys."0.26.4"."clang_3_8" or false) ||
        (f.clang_sys."0.26.4".clang_3_9 or false) ||
        (clang_sys."0.26.4"."clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4".gte_clang_3_8 =
        (f.clang_sys."0.26.4".gte_clang_3_8 or false) ||
        (f.clang_sys."0.26.4".clang_3_8 or false) ||
        (clang_sys."0.26.4"."clang_3_8" or false) ||
        (f.clang_sys."0.26.4".clang_3_9 or false) ||
        (clang_sys."0.26.4"."clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4".gte_clang_3_9 =
        (f.clang_sys."0.26.4".gte_clang_3_9 or false) ||
        (f.clang_sys."0.26.4".clang_3_9 or false) ||
        (clang_sys."0.26.4"."clang_3_9" or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4".gte_clang_4_0 =
        (f.clang_sys."0.26.4".gte_clang_4_0 or false) ||
        (f.clang_sys."0.26.4".clang_4_0 or false) ||
        (clang_sys."0.26.4"."clang_4_0" or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4".gte_clang_5_0 =
        (f.clang_sys."0.26.4".gte_clang_5_0 or false) ||
        (f.clang_sys."0.26.4".clang_5_0 or false) ||
        (clang_sys."0.26.4"."clang_5_0" or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4".gte_clang_6_0 =
        (f.clang_sys."0.26.4".gte_clang_6_0 or false) ||
        (f.clang_sys."0.26.4".clang_6_0 or false) ||
        (clang_sys."0.26.4"."clang_6_0" or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4".gte_clang_7_0 =
        (f.clang_sys."0.26.4".gte_clang_7_0 or false) ||
        (f.clang_sys."0.26.4".clang_7_0 or false) ||
        (clang_sys."0.26.4"."clang_7_0" or false); }
      { "0.26.4".libloading =
        (f.clang_sys."0.26.4".libloading or false) ||
        (f.clang_sys."0.26.4".runtime or false) ||
        (clang_sys."0.26.4"."runtime" or false); }
    ];
    glob."${deps.clang_sys."0.26.4".glob}".default = true;
    libc."${deps.clang_sys."0.26.4".libc}".default = (f.libc."${deps.clang_sys."0.26.4".libc}".default or false);
    libloading."${deps.clang_sys."0.26.4".libloading}".default = true;
  }) [
    (features_.glob."${deps."clang_sys"."0.26.4"."glob"}" deps)
    (features_.libc."${deps."clang_sys"."0.26.4"."libc"}" deps)
    (features_.libloading."${deps."clang_sys"."0.26.4"."libloading"}" deps)
    (features_.glob."${deps."clang_sys"."0.26.4"."glob"}" deps)
  ];


# end
# clap-2.32.0

  crates.clap."2.32.0" = deps: { features?(features_.clap."2.32.0" deps {}) }: buildRustCrate {
    crateName = "clap";
    version = "2.32.0";
    authors = [ "Kevin K. <kbknapp@gmail.com>" ];
    sha256 = "1hdjf0janvpjkwrjdjx1mm2aayzr54k72w6mriyr0n5anjkcj1lx";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."clap"."2.32.0"."bitflags"}" deps)
      (crates."textwrap"."${deps."clap"."2.32.0"."textwrap"}" deps)
      (crates."unicode_width"."${deps."clap"."2.32.0"."unicode_width"}" deps)
    ]
      ++ (if features.clap."2.32.0".atty or false then [ (crates.atty."${deps."clap"."2.32.0".atty}" deps) ] else [])
      ++ (if features.clap."2.32.0".strsim or false then [ (crates.strsim."${deps."clap"."2.32.0".strsim}" deps) ] else [])
      ++ (if features.clap."2.32.0".vec_map or false then [ (crates.vec_map."${deps."clap"."2.32.0".vec_map}" deps) ] else []))
      ++ (if !(kernel == "windows") then mapFeatures features ([
    ]
      ++ (if features.clap."2.32.0".ansi_term or false then [ (crates.ansi_term."${deps."clap"."2.32.0".ansi_term}" deps) ] else [])) else []);
    features = mkFeatures (features."clap"."2.32.0" or {});
  };
  features_.clap."2.32.0" = deps: f: updateFeatures f (rec {
    ansi_term."${deps.clap."2.32.0".ansi_term}".default = true;
    atty."${deps.clap."2.32.0".atty}".default = true;
    bitflags."${deps.clap."2.32.0".bitflags}".default = true;
    clap = fold recursiveUpdate {} [
      { "2.32.0".ansi_term =
        (f.clap."2.32.0".ansi_term or false) ||
        (f.clap."2.32.0".color or false) ||
        (clap."2.32.0"."color" or false); }
      { "2.32.0".atty =
        (f.clap."2.32.0".atty or false) ||
        (f.clap."2.32.0".color or false) ||
        (clap."2.32.0"."color" or false); }
      { "2.32.0".clippy =
        (f.clap."2.32.0".clippy or false) ||
        (f.clap."2.32.0".lints or false) ||
        (clap."2.32.0"."lints" or false); }
      { "2.32.0".color =
        (f.clap."2.32.0".color or false) ||
        (f.clap."2.32.0".default or false) ||
        (clap."2.32.0"."default" or false); }
      { "2.32.0".default = (f.clap."2.32.0".default or true); }
      { "2.32.0".strsim =
        (f.clap."2.32.0".strsim or false) ||
        (f.clap."2.32.0".suggestions or false) ||
        (clap."2.32.0"."suggestions" or false); }
      { "2.32.0".suggestions =
        (f.clap."2.32.0".suggestions or false) ||
        (f.clap."2.32.0".default or false) ||
        (clap."2.32.0"."default" or false); }
      { "2.32.0".term_size =
        (f.clap."2.32.0".term_size or false) ||
        (f.clap."2.32.0".wrap_help or false) ||
        (clap."2.32.0"."wrap_help" or false); }
      { "2.32.0".vec_map =
        (f.clap."2.32.0".vec_map or false) ||
        (f.clap."2.32.0".default or false) ||
        (clap."2.32.0"."default" or false); }
      { "2.32.0".yaml =
        (f.clap."2.32.0".yaml or false) ||
        (f.clap."2.32.0".doc or false) ||
        (clap."2.32.0"."doc" or false); }
      { "2.32.0".yaml-rust =
        (f.clap."2.32.0".yaml-rust or false) ||
        (f.clap."2.32.0".yaml or false) ||
        (clap."2.32.0"."yaml" or false); }
    ];
    strsim."${deps.clap."2.32.0".strsim}".default = true;
    textwrap = fold recursiveUpdate {} [
      { "${deps.clap."2.32.0".textwrap}"."term_size" =
        (f.textwrap."${deps.clap."2.32.0".textwrap}"."term_size" or false) ||
        (clap."2.32.0"."wrap_help" or false) ||
        (f."clap"."2.32.0"."wrap_help" or false); }
      { "${deps.clap."2.32.0".textwrap}".default = true; }
    ];
    unicode_width."${deps.clap."2.32.0".unicode_width}".default = true;
    vec_map."${deps.clap."2.32.0".vec_map}".default = true;
  }) [
    (features_.atty."${deps."clap"."2.32.0"."atty"}" deps)
    (features_.bitflags."${deps."clap"."2.32.0"."bitflags"}" deps)
    (features_.strsim."${deps."clap"."2.32.0"."strsim"}" deps)
    (features_.textwrap."${deps."clap"."2.32.0"."textwrap"}" deps)
    (features_.unicode_width."${deps."clap"."2.32.0"."unicode_width"}" deps)
    (features_.vec_map."${deps."clap"."2.32.0"."vec_map"}" deps)
    (features_.ansi_term."${deps."clap"."2.32.0"."ansi_term"}" deps)
  ];


# end
# cloudabi-0.0.3

  crates.cloudabi."0.0.3" = deps: { features?(features_.cloudabi."0.0.3" deps {}) }: buildRustCrate {
    crateName = "cloudabi";
    version = "0.0.3";
    authors = [ "Nuxi (https://nuxi.nl/) and contributors" ];
    sha256 = "1z9lby5sr6vslfd14d6igk03s7awf91mxpsfmsp3prxbxlk0x7h5";
    libPath = "cloudabi.rs";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.cloudabi."0.0.3".bitflags or false then [ (crates.bitflags."${deps."cloudabi"."0.0.3".bitflags}" deps) ] else []));
    features = mkFeatures (features."cloudabi"."0.0.3" or {});
  };
  features_.cloudabi."0.0.3" = deps: f: updateFeatures f (rec {
    bitflags."${deps.cloudabi."0.0.3".bitflags}".default = true;
    cloudabi = fold recursiveUpdate {} [
      { "0.0.3".bitflags =
        (f.cloudabi."0.0.3".bitflags or false) ||
        (f.cloudabi."0.0.3".default or false) ||
        (cloudabi."0.0.3"."default" or false); }
      { "0.0.3".default = (f.cloudabi."0.0.3".default or true); }
    ];
  }) [
    (features_.bitflags."${deps."cloudabi"."0.0.3"."bitflags"}" deps)
  ];


# end
# crossbeam-deque-0.2.0

  crates.crossbeam_deque."0.2.0" = deps: { features?(features_.crossbeam_deque."0.2.0" deps {}) }: buildRustCrate {
    crateName = "crossbeam-deque";
    version = "0.2.0";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1h3n1p1qy45b6388j3svfy1m72xlcx9j9a5y0mww6jz8fmknipnb";
    dependencies = mapFeatures features ([
      (crates."crossbeam_epoch"."${deps."crossbeam_deque"."0.2.0"."crossbeam_epoch"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_deque"."0.2.0"."crossbeam_utils"}" deps)
    ]);
  };
  features_.crossbeam_deque."0.2.0" = deps: f: updateFeatures f (rec {
    crossbeam_deque."0.2.0".default = (f.crossbeam_deque."0.2.0".default or true);
    crossbeam_epoch."${deps.crossbeam_deque."0.2.0".crossbeam_epoch}".default = true;
    crossbeam_utils."${deps.crossbeam_deque."0.2.0".crossbeam_utils}".default = true;
  }) [
    (features_.crossbeam_epoch."${deps."crossbeam_deque"."0.2.0"."crossbeam_epoch"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_deque"."0.2.0"."crossbeam_utils"}" deps)
  ];


# end
# crossbeam-epoch-0.3.1

  crates.crossbeam_epoch."0.3.1" = deps: { features?(features_.crossbeam_epoch."0.3.1" deps {}) }: buildRustCrate {
    crateName = "crossbeam-epoch";
    version = "0.3.1";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "1ljrrpvalabi3r2nnpcz7rqkbl2ydmd0mrrr2fv335f7d46xgfxa";
    dependencies = mapFeatures features ([
      (crates."arrayvec"."${deps."crossbeam_epoch"."0.3.1"."arrayvec"}" deps)
      (crates."cfg_if"."${deps."crossbeam_epoch"."0.3.1"."cfg_if"}" deps)
      (crates."crossbeam_utils"."${deps."crossbeam_epoch"."0.3.1"."crossbeam_utils"}" deps)
      (crates."memoffset"."${deps."crossbeam_epoch"."0.3.1"."memoffset"}" deps)
      (crates."nodrop"."${deps."crossbeam_epoch"."0.3.1"."nodrop"}" deps)
      (crates."scopeguard"."${deps."crossbeam_epoch"."0.3.1"."scopeguard"}" deps)
    ]
      ++ (if features.crossbeam_epoch."0.3.1".lazy_static or false then [ (crates.lazy_static."${deps."crossbeam_epoch"."0.3.1".lazy_static}" deps) ] else []));
    features = mkFeatures (features."crossbeam_epoch"."0.3.1" or {});
  };
  features_.crossbeam_epoch."0.3.1" = deps: f: updateFeatures f (rec {
    arrayvec = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.3.1".arrayvec}"."use_union" =
        (f.arrayvec."${deps.crossbeam_epoch."0.3.1".arrayvec}"."use_union" or false) ||
        (crossbeam_epoch."0.3.1"."nightly" or false) ||
        (f."crossbeam_epoch"."0.3.1"."nightly" or false); }
      { "${deps.crossbeam_epoch."0.3.1".arrayvec}".default = (f.arrayvec."${deps.crossbeam_epoch."0.3.1".arrayvec}".default or false); }
    ];
    cfg_if."${deps.crossbeam_epoch."0.3.1".cfg_if}".default = true;
    crossbeam_epoch = fold recursiveUpdate {} [
      { "0.3.1".default = (f.crossbeam_epoch."0.3.1".default or true); }
      { "0.3.1".lazy_static =
        (f.crossbeam_epoch."0.3.1".lazy_static or false) ||
        (f.crossbeam_epoch."0.3.1".use_std or false) ||
        (crossbeam_epoch."0.3.1"."use_std" or false); }
      { "0.3.1".use_std =
        (f.crossbeam_epoch."0.3.1".use_std or false) ||
        (f.crossbeam_epoch."0.3.1".default or false) ||
        (crossbeam_epoch."0.3.1"."default" or false); }
    ];
    crossbeam_utils = fold recursiveUpdate {} [
      { "${deps.crossbeam_epoch."0.3.1".crossbeam_utils}"."use_std" =
        (f.crossbeam_utils."${deps.crossbeam_epoch."0.3.1".crossbeam_utils}"."use_std" or false) ||
        (crossbeam_epoch."0.3.1"."use_std" or false) ||
        (f."crossbeam_epoch"."0.3.1"."use_std" or false); }
      { "${deps.crossbeam_epoch."0.3.1".crossbeam_utils}".default = (f.crossbeam_utils."${deps.crossbeam_epoch."0.3.1".crossbeam_utils}".default or false); }
    ];
    lazy_static."${deps.crossbeam_epoch."0.3.1".lazy_static}".default = true;
    memoffset."${deps.crossbeam_epoch."0.3.1".memoffset}".default = true;
    nodrop."${deps.crossbeam_epoch."0.3.1".nodrop}".default = (f.nodrop."${deps.crossbeam_epoch."0.3.1".nodrop}".default or false);
    scopeguard."${deps.crossbeam_epoch."0.3.1".scopeguard}".default = (f.scopeguard."${deps.crossbeam_epoch."0.3.1".scopeguard}".default or false);
  }) [
    (features_.arrayvec."${deps."crossbeam_epoch"."0.3.1"."arrayvec"}" deps)
    (features_.cfg_if."${deps."crossbeam_epoch"."0.3.1"."cfg_if"}" deps)
    (features_.crossbeam_utils."${deps."crossbeam_epoch"."0.3.1"."crossbeam_utils"}" deps)
    (features_.lazy_static."${deps."crossbeam_epoch"."0.3.1"."lazy_static"}" deps)
    (features_.memoffset."${deps."crossbeam_epoch"."0.3.1"."memoffset"}" deps)
    (features_.nodrop."${deps."crossbeam_epoch"."0.3.1"."nodrop"}" deps)
    (features_.scopeguard."${deps."crossbeam_epoch"."0.3.1"."scopeguard"}" deps)
  ];


# end
# crossbeam-utils-0.2.2

  crates.crossbeam_utils."0.2.2" = deps: { features?(features_.crossbeam_utils."0.2.2" deps {}) }: buildRustCrate {
    crateName = "crossbeam-utils";
    version = "0.2.2";
    authors = [ "The Crossbeam Project Developers" ];
    sha256 = "0jiwzxv0lysjq68yk4bzkygrf69zhdidyw55nxlmimxlm6xv0j4m";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."crossbeam_utils"."0.2.2"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."crossbeam_utils"."0.2.2" or {});
  };
  features_.crossbeam_utils."0.2.2" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.crossbeam_utils."0.2.2".cfg_if}".default = true;
    crossbeam_utils = fold recursiveUpdate {} [
      { "0.2.2".default = (f.crossbeam_utils."0.2.2".default or true); }
      { "0.2.2".use_std =
        (f.crossbeam_utils."0.2.2".use_std or false) ||
        (f.crossbeam_utils."0.2.2".default or false) ||
        (crossbeam_utils."0.2.2"."default" or false); }
    ];
  }) [
    (features_.cfg_if."${deps."crossbeam_utils"."0.2.2"."cfg_if"}" deps)
  ];


# end
# either-1.5.1

  crates.either."1.5.1" = deps: { features?(features_.either."1.5.1" deps {}) }: buildRustCrate {
    crateName = "either";
    version = "1.5.1";
    authors = [ "bluss" ];
    sha256 = "049dmvnyrrhf0fw955jrfazdapdl84x32grwwxllh8in39yv3783";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."either"."1.5.1" or {});
  };
  features_.either."1.5.1" = deps: f: updateFeatures f (rec {
    either = fold recursiveUpdate {} [
      { "1.5.1".default = (f.either."1.5.1".default or true); }
      { "1.5.1".use_std =
        (f.either."1.5.1".use_std or false) ||
        (f.either."1.5.1".default or false) ||
        (either."1.5.1"."default" or false); }
    ];
  }) [];


# end
# env_logger-0.6.1

  crates.env_logger."0.6.1" = deps: { features?(features_.env_logger."0.6.1" deps {}) }: buildRustCrate {
    crateName = "env_logger";
    version = "0.6.1";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1d02i2yaqpnmbgw42pf0hd56ddd9jr4zq5yypbmfvc8rs13x0jql";
    dependencies = mapFeatures features ([
      (crates."log"."${deps."env_logger"."0.6.1"."log"}" deps)
    ]
      ++ (if features.env_logger."0.6.1".atty or false then [ (crates.atty."${deps."env_logger"."0.6.1".atty}" deps) ] else [])
      ++ (if features.env_logger."0.6.1".humantime or false then [ (crates.humantime."${deps."env_logger"."0.6.1".humantime}" deps) ] else [])
      ++ (if features.env_logger."0.6.1".regex or false then [ (crates.regex."${deps."env_logger"."0.6.1".regex}" deps) ] else [])
      ++ (if features.env_logger."0.6.1".termcolor or false then [ (crates.termcolor."${deps."env_logger"."0.6.1".termcolor}" deps) ] else []));
    features = mkFeatures (features."env_logger"."0.6.1" or {});
  };
  features_.env_logger."0.6.1" = deps: f: updateFeatures f (rec {
    atty."${deps.env_logger."0.6.1".atty}".default = true;
    env_logger = fold recursiveUpdate {} [
      { "0.6.1".atty =
        (f.env_logger."0.6.1".atty or false) ||
        (f.env_logger."0.6.1".default or false) ||
        (env_logger."0.6.1"."default" or false); }
      { "0.6.1".default = (f.env_logger."0.6.1".default or true); }
      { "0.6.1".humantime =
        (f.env_logger."0.6.1".humantime or false) ||
        (f.env_logger."0.6.1".default or false) ||
        (env_logger."0.6.1"."default" or false); }
      { "0.6.1".regex =
        (f.env_logger."0.6.1".regex or false) ||
        (f.env_logger."0.6.1".default or false) ||
        (env_logger."0.6.1"."default" or false); }
      { "0.6.1".termcolor =
        (f.env_logger."0.6.1".termcolor or false) ||
        (f.env_logger."0.6.1".default or false) ||
        (env_logger."0.6.1"."default" or false); }
    ];
    humantime."${deps.env_logger."0.6.1".humantime}".default = true;
    log = fold recursiveUpdate {} [
      { "${deps.env_logger."0.6.1".log}"."std" = true; }
      { "${deps.env_logger."0.6.1".log}".default = true; }
    ];
    regex."${deps.env_logger."0.6.1".regex}".default = true;
    termcolor."${deps.env_logger."0.6.1".termcolor}".default = true;
  }) [
    (features_.atty."${deps."env_logger"."0.6.1"."atty"}" deps)
    (features_.humantime."${deps."env_logger"."0.6.1"."humantime"}" deps)
    (features_.log."${deps."env_logger"."0.6.1"."log"}" deps)
    (features_.regex."${deps."env_logger"."0.6.1"."regex"}" deps)
    (features_.termcolor."${deps."env_logger"."0.6.1"."termcolor"}" deps)
  ];


# end
# failure-0.1.5

  crates.failure."0.1.5" = deps: { features?(features_.failure."0.1.5" deps {}) }: buildRustCrate {
    crateName = "failure";
    version = "0.1.5";
    authors = [ "Without Boats <boats@mozilla.com>" ];
    sha256 = "1msaj1c0fg12dzyf4fhxqlx1gfx41lj2smdjmkc9hkrgajk2g3kx";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.failure."0.1.5".backtrace or false then [ (crates.backtrace."${deps."failure"."0.1.5".backtrace}" deps) ] else []));
    features = mkFeatures (features."failure"."0.1.5" or {});
  };
  features_.failure."0.1.5" = deps: f: updateFeatures f (rec {
    backtrace."${deps.failure."0.1.5".backtrace}".default = true;
    failure = fold recursiveUpdate {} [
      { "0.1.5".backtrace =
        (f.failure."0.1.5".backtrace or false) ||
        (f.failure."0.1.5".std or false) ||
        (failure."0.1.5"."std" or false); }
      { "0.1.5".default = (f.failure."0.1.5".default or true); }
      { "0.1.5".derive =
        (f.failure."0.1.5".derive or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
      { "0.1.5".failure_derive =
        (f.failure."0.1.5".failure_derive or false) ||
        (f.failure."0.1.5".derive or false) ||
        (failure."0.1.5"."derive" or false); }
      { "0.1.5".std =
        (f.failure."0.1.5".std or false) ||
        (f.failure."0.1.5".default or false) ||
        (failure."0.1.5"."default" or false); }
    ];
  }) [
    (features_.backtrace."${deps."failure"."0.1.5"."backtrace"}" deps)
  ];


# end
# fs_extra-1.1.0

  crates.fs_extra."1.1.0" = deps: { features?(features_.fs_extra."1.1.0" deps {}) }: buildRustCrate {
    crateName = "fs_extra";
    version = "1.1.0";
    authors = [ "Denis Kurilenko <webdesus@gmail.com>" ];
    sha256 = "0zp4q7k4s8kwwkylj13ccpdh7mc64wcc092nia6ilpyk9ppgl3d9";
  };
  features_.fs_extra."1.1.0" = deps: f: updateFeatures f (rec {
    fs_extra."1.1.0".default = (f.fs_extra."1.1.0".default or true);
  }) [];


# end
# fst-0.3.3

  crates.fst."0.3.3" = deps: { features?(features_.fst."0.3.3" deps {}) }: buildRustCrate {
    crateName = "fst";
    version = "0.3.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1q6xvf444sfd21ng1f4l5jkkam4an9zc39hmp46r0h7ld1q6f899";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."fst"."0.3.3"."byteorder"}" deps)
    ]
      ++ (if features.fst."0.3.3".memmap or false then [ (crates.memmap."${deps."fst"."0.3.3".memmap}" deps) ] else []));
    features = mkFeatures (features."fst"."0.3.3" or {});
  };
  features_.fst."0.3.3" = deps: f: updateFeatures f (rec {
    byteorder."${deps.fst."0.3.3".byteorder}".default = true;
    fst = fold recursiveUpdate {} [
      { "0.3.3".default = (f.fst."0.3.3".default or true); }
      { "0.3.3".memmap =
        (f.fst."0.3.3".memmap or false) ||
        (f.fst."0.3.3".mmap or false) ||
        (fst."0.3.3"."mmap" or false); }
      { "0.3.3".mmap =
        (f.fst."0.3.3".mmap or false) ||
        (f.fst."0.3.3".default or false) ||
        (fst."0.3.3"."default" or false); }
    ];
    memmap."${deps.fst."0.3.3".memmap}".default = true;
  }) [
    (features_.byteorder."${deps."fst"."0.3.3"."byteorder"}" deps)
    (features_.memmap."${deps."fst"."0.3.3"."memmap"}" deps)
  ];


# end
# fst-levenshtein-0.2.1

  crates.fst_levenshtein."0.2.1" = deps: { features?(features_.fst_levenshtein."0.2.1" deps {}) }: buildRustCrate {
    crateName = "fst-levenshtein";
    version = "0.2.1";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0in5z4fq6xg6igd2lb9kqigyar47nnfls2psaalmyrk0ss060fik";
    dependencies = mapFeatures features ([
      (crates."fst"."${deps."fst_levenshtein"."0.2.1"."fst"}" deps)
      (crates."utf8_ranges"."${deps."fst_levenshtein"."0.2.1"."utf8_ranges"}" deps)
    ]);
  };
  features_.fst_levenshtein."0.2.1" = deps: f: updateFeatures f (rec {
    fst."${deps.fst_levenshtein."0.2.1".fst}".default = true;
    fst_levenshtein."0.2.1".default = (f.fst_levenshtein."0.2.1".default or true);
    utf8_ranges."${deps.fst_levenshtein."0.2.1".utf8_ranges}".default = true;
  }) [
    (features_.fst."${deps."fst_levenshtein"."0.2.1"."fst"}" deps)
    (features_.utf8_ranges."${deps."fst_levenshtein"."0.2.1"."utf8_ranges"}" deps)
  ];


# end
# fst-regex-0.2.2

  crates.fst_regex."0.2.2" = deps: { features?(features_.fst_regex."0.2.2" deps {}) }: buildRustCrate {
    crateName = "fst-regex";
    version = "0.2.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1bgl90604ncgw82m9rj7481pzyx8l9dpcpb8pa9s8sxzb2bsf6mn";
    dependencies = mapFeatures features ([
      (crates."fst"."${deps."fst_regex"."0.2.2"."fst"}" deps)
      (crates."regex_syntax"."${deps."fst_regex"."0.2.2"."regex_syntax"}" deps)
      (crates."utf8_ranges"."${deps."fst_regex"."0.2.2"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."fst_regex"."0.2.2" or {});
  };
  features_.fst_regex."0.2.2" = deps: f: updateFeatures f (rec {
    fst = fold recursiveUpdate {} [
      { "${deps.fst_regex."0.2.2".fst}"."mmap" =
        (f.fst."${deps.fst_regex."0.2.2".fst}"."mmap" or false) ||
        (fst_regex."0.2.2"."mmap" or false) ||
        (f."fst_regex"."0.2.2"."mmap" or false); }
      { "${deps.fst_regex."0.2.2".fst}".default = (f.fst."${deps.fst_regex."0.2.2".fst}".default or false); }
    ];
    fst_regex = fold recursiveUpdate {} [
      { "0.2.2".default = (f.fst_regex."0.2.2".default or true); }
      { "0.2.2".mmap =
        (f.fst_regex."0.2.2".mmap or false) ||
        (f.fst_regex."0.2.2".default or false) ||
        (fst_regex."0.2.2"."default" or false); }
    ];
    regex_syntax."${deps.fst_regex."0.2.2".regex_syntax}".default = true;
    utf8_ranges."${deps.fst_regex."0.2.2".utf8_ranges}".default = true;
  }) [
    (features_.fst."${deps."fst_regex"."0.2.2"."fst"}" deps)
    (features_.regex_syntax."${deps."fst_regex"."0.2.2"."regex_syntax"}" deps)
    (features_.utf8_ranges."${deps."fst_regex"."0.2.2"."utf8_ranges"}" deps)
  ];


# end
# fuchsia-cprng-0.1.1

  crates.fuchsia_cprng."0.1.1" = deps: { features?(features_.fuchsia_cprng."0.1.1" deps {}) }: buildRustCrate {
    crateName = "fuchsia-cprng";
    version = "0.1.1";
    authors = [ "Erick Tryzelaar <etryzelaar@google.com>" ];
    edition = "2018";
    sha256 = "07apwv9dj716yjlcj29p94vkqn5zmfh7hlrqvrjx3wzshphc95h9";
  };
  features_.fuchsia_cprng."0.1.1" = deps: f: updateFeatures f (rec {
    fuchsia_cprng."0.1.1".default = (f.fuchsia_cprng."0.1.1".default or true);
  }) [];


# end
# glob-0.2.11

  crates.glob."0.2.11" = deps: { features?(features_.glob."0.2.11" deps {}) }: buildRustCrate {
    crateName = "glob";
    version = "0.2.11";
    authors = [ "The Rust Project Developers" ];
    sha256 = "104389jjxs8r2f5cc9p0axhjmndgln60ih5x4f00ccgg9d3zarlf";
  };
  features_.glob."0.2.11" = deps: f: updateFeatures f (rec {
    glob."0.2.11".default = (f.glob."0.2.11".default or true);
  }) [];


# end
# graceful-0.1.1

  crates.graceful."0.1.1" = deps: { features?(features_.graceful."0.1.1" deps {}) }: buildRustCrate {
    crateName = "graceful";
    version = "0.1.1";
    authors = [ "Zhe Wang <0x1998@gmail.com>" ];
    sha256 = "0si1mlkh3b72s6xcw6w9i15n31xd5vqhn020ysdr3zggmx432ldf";
    dependencies = mapFeatures features ([
      (crates."kernel32_sys"."${deps."graceful"."0.1.1"."kernel32_sys"}" deps)
      (crates."nix"."${deps."graceful"."0.1.1"."nix"}" deps)
    ]);
  };
  features_.graceful."0.1.1" = deps: f: updateFeatures f (rec {
    graceful."0.1.1".default = (f.graceful."0.1.1".default or true);
    kernel32_sys."${deps.graceful."0.1.1".kernel32_sys}".default = true;
    nix."${deps.graceful."0.1.1".nix}".default = true;
  }) [
    (features_.kernel32_sys."${deps."graceful"."0.1.1"."kernel32_sys"}" deps)
    (features_.nix."${deps."graceful"."0.1.1"."nix"}" deps)
  ];


# end
# hashbrown-0.1.8

  crates.hashbrown."0.1.8" = deps: { features?(features_.hashbrown."0.1.8" deps {}) }: buildRustCrate {
    crateName = "hashbrown";
    version = "0.1.8";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "047fk80pg59cdn5lz4h2a514fmgmya896dvy3dqqviia52a27fzh";
    dependencies = mapFeatures features ([
      (crates."byteorder"."${deps."hashbrown"."0.1.8"."byteorder"}" deps)
      (crates."scopeguard"."${deps."hashbrown"."0.1.8"."scopeguard"}" deps)
    ]);
    features = mkFeatures (features."hashbrown"."0.1.8" or {});
  };
  features_.hashbrown."0.1.8" = deps: f: updateFeatures f (rec {
    byteorder."${deps.hashbrown."0.1.8".byteorder}".default = (f.byteorder."${deps.hashbrown."0.1.8".byteorder}".default or false);
    hashbrown."0.1.8".default = (f.hashbrown."0.1.8".default or true);
    scopeguard."${deps.hashbrown."0.1.8".scopeguard}".default = (f.scopeguard."${deps.hashbrown."0.1.8".scopeguard}".default or false);
  }) [
    (features_.byteorder."${deps."hashbrown"."0.1.8"."byteorder"}" deps)
    (features_.scopeguard."${deps."hashbrown"."0.1.8"."scopeguard"}" deps)
  ];


# end
# humantime-1.2.0

  crates.humantime."1.2.0" = deps: { features?(features_.humantime."1.2.0" deps {}) }: buildRustCrate {
    crateName = "humantime";
    version = "1.2.0";
    authors = [ "Paul Colomiets <paul@colomiets.name>" ];
    sha256 = "0wlcxzz2mhq0brkfbjb12hc6jm17bgm8m6pdgblw4qjwmf26aw28";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."quick_error"."${deps."humantime"."1.2.0"."quick_error"}" deps)
    ]);
  };
  features_.humantime."1.2.0" = deps: f: updateFeatures f (rec {
    humantime."1.2.0".default = (f.humantime."1.2.0".default or true);
    quick_error."${deps.humantime."1.2.0".quick_error}".default = true;
  }) [
    (features_.quick_error."${deps."humantime"."1.2.0"."quick_error"}" deps)
  ];


# end
# jemalloc-sys-0.3.0

  crates.jemalloc_sys."0.3.0" = deps: { features?(features_.jemalloc_sys."0.3.0" deps {}) }: buildRustCrate {
    crateName = "jemalloc-sys";
    version = "0.3.0";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Gonzalo Brito Gadeschi <gonzalobg88@gmail.com>" ];
    edition = "2015";
    sha256 = "18v46d06nnllmzijk0wj9j3s0hnxjzm55r2amfpnzhz3af7q78wl";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."jemalloc_sys"."0.3.0"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."jemalloc_sys"."0.3.0"."cc"}" deps)
      (crates."fs_extra"."${deps."jemalloc_sys"."0.3.0"."fs_extra"}" deps)
    ]);
    features = mkFeatures (features."jemalloc_sys"."0.3.0" or {});
  };
  features_.jemalloc_sys."0.3.0" = deps: f: updateFeatures f (rec {
    cc."${deps.jemalloc_sys."0.3.0".cc}".default = true;
    fs_extra."${deps.jemalloc_sys."0.3.0".fs_extra}".default = true;
    jemalloc_sys = fold recursiveUpdate {} [
      { "0.3.0".background_threads_runtime_support =
        (f.jemalloc_sys."0.3.0".background_threads_runtime_support or false) ||
        (f.jemalloc_sys."0.3.0".background_threads or false) ||
        (jemalloc_sys."0.3.0"."background_threads" or false) ||
        (f.jemalloc_sys."0.3.0".default or false) ||
        (jemalloc_sys."0.3.0"."default" or false); }
      { "0.3.0".default = (f.jemalloc_sys."0.3.0".default or true); }
    ];
    libc."${deps.jemalloc_sys."0.3.0".libc}".default = (f.libc."${deps.jemalloc_sys."0.3.0".libc}".default or false);
  }) [
    (features_.libc."${deps."jemalloc_sys"."0.3.0"."libc"}" deps)
    (features_.cc."${deps."jemalloc_sys"."0.3.0"."cc"}" deps)
    (features_.fs_extra."${deps."jemalloc_sys"."0.3.0"."fs_extra"}" deps)
  ];


# end
# jemallocator-0.3.0

  crates.jemallocator."0.3.0" = deps: { features?(features_.jemallocator."0.3.0" deps {}) }: buildRustCrate {
    crateName = "jemallocator";
    version = "0.3.0";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Gonzalo Brito Gadeschi <gonzalobg88@gmail.com>" "Simon Sapin <simon.sapin@exyr.org>" "Steven Fackler <sfackler@gmail.com>" ];
    edition = "2015";
    sha256 = "06rglc8bkvij3faq3ybgk4m81p6mzrm5i7vr8mpmh0a6qn4lh6xc";
    dependencies = mapFeatures features ([
      (crates."jemalloc_sys"."${deps."jemallocator"."0.3.0"."jemalloc_sys"}" deps)
      (crates."libc"."${deps."jemallocator"."0.3.0"."libc"}" deps)
    ]);
    features = mkFeatures (features."jemallocator"."0.3.0" or {});
  };
  features_.jemallocator."0.3.0" = deps: f: updateFeatures f (rec {
    jemalloc_sys = fold recursiveUpdate {} [
      { "${deps.jemallocator."0.3.0".jemalloc_sys}"."background_threads" =
        (f.jemalloc_sys."${deps.jemallocator."0.3.0".jemalloc_sys}"."background_threads" or false) ||
        (jemallocator."0.3.0"."background_threads" or false) ||
        (f."jemallocator"."0.3.0"."background_threads" or false); }
      { "${deps.jemallocator."0.3.0".jemalloc_sys}"."background_threads_runtime_support" =
        (f.jemalloc_sys."${deps.jemallocator."0.3.0".jemalloc_sys}"."background_threads_runtime_support" or false) ||
        (jemallocator."0.3.0"."background_threads_runtime_support" or false) ||
        (f."jemallocator"."0.3.0"."background_threads_runtime_support" or false); }
      { "${deps.jemallocator."0.3.0".jemalloc_sys}"."debug" =
        (f.jemalloc_sys."${deps.jemallocator."0.3.0".jemalloc_sys}"."debug" or false) ||
        (jemallocator."0.3.0"."debug" or false) ||
        (f."jemallocator"."0.3.0"."debug" or false); }
      { "${deps.jemallocator."0.3.0".jemalloc_sys}"."disable_initial_exec_tls" =
        (f.jemalloc_sys."${deps.jemallocator."0.3.0".jemalloc_sys}"."disable_initial_exec_tls" or false) ||
        (jemallocator."0.3.0"."disable_initial_exec_tls" or false) ||
        (f."jemallocator"."0.3.0"."disable_initial_exec_tls" or false); }
      { "${deps.jemallocator."0.3.0".jemalloc_sys}"."profiling" =
        (f.jemalloc_sys."${deps.jemallocator."0.3.0".jemalloc_sys}"."profiling" or false) ||
        (jemallocator."0.3.0"."profiling" or false) ||
        (f."jemallocator"."0.3.0"."profiling" or false); }
      { "${deps.jemallocator."0.3.0".jemalloc_sys}"."stats" =
        (f.jemalloc_sys."${deps.jemallocator."0.3.0".jemalloc_sys}"."stats" or false) ||
        (jemallocator."0.3.0"."stats" or false) ||
        (f."jemallocator"."0.3.0"."stats" or false); }
      { "${deps.jemallocator."0.3.0".jemalloc_sys}"."unprefixed_malloc_on_supported_platforms" =
        (f.jemalloc_sys."${deps.jemallocator."0.3.0".jemalloc_sys}"."unprefixed_malloc_on_supported_platforms" or false) ||
        (jemallocator."0.3.0"."unprefixed_malloc_on_supported_platforms" or false) ||
        (f."jemallocator"."0.3.0"."unprefixed_malloc_on_supported_platforms" or false); }
      { "${deps.jemallocator."0.3.0".jemalloc_sys}".default = (f.jemalloc_sys."${deps.jemallocator."0.3.0".jemalloc_sys}".default or false); }
    ];
    jemallocator = fold recursiveUpdate {} [
      { "0.3.0".background_threads_runtime_support =
        (f.jemallocator."0.3.0".background_threads_runtime_support or false) ||
        (f.jemallocator."0.3.0".default or false) ||
        (jemallocator."0.3.0"."default" or false); }
      { "0.3.0".default = (f.jemallocator."0.3.0".default or true); }
    ];
    libc."${deps.jemallocator."0.3.0".libc}".default = (f.libc."${deps.jemallocator."0.3.0".libc}".default or false);
  }) [
    (features_.jemalloc_sys."${deps."jemallocator"."0.3.0"."jemalloc_sys"}" deps)
    (features_.libc."${deps."jemallocator"."0.3.0"."libc"}" deps)
  ];


# end
# kernel32-sys-0.2.2

  crates.kernel32_sys."0.2.2" = deps: { features?(features_.kernel32_sys."0.2.2" deps {}) }: buildRustCrate {
    crateName = "kernel32-sys";
    version = "0.2.2";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
    libName = "kernel32";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."winapi_build"."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
    ]);
  };
  features_.kernel32_sys."0.2.2" = deps: f: updateFeatures f (rec {
    kernel32_sys."0.2.2".default = (f.kernel32_sys."0.2.2".default or true);
    winapi."${deps.kernel32_sys."0.2.2".winapi}".default = true;
    winapi_build."${deps.kernel32_sys."0.2.2".winapi_build}".default = true;
  }) [
    (features_.winapi."${deps."kernel32_sys"."0.2.2"."winapi"}" deps)
    (features_.winapi_build."${deps."kernel32_sys"."0.2.2"."winapi_build"}" deps)
  ];


# end
# lazy_static-1.3.0

  crates.lazy_static."1.3.0" = deps: { features?(features_.lazy_static."1.3.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.3.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "1vv47va18ydk7dx5paz88g3jy1d3lwbx6qpxkbj8gyfv770i4b1y";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.3.0" or {});
  };
  features_.lazy_static."1.3.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.3.0".default = (f.lazy_static."1.3.0".default or true); }
      { "1.3.0".spin =
        (f.lazy_static."1.3.0".spin or false) ||
        (f.lazy_static."1.3.0".spin_no_std or false) ||
        (lazy_static."1.3.0"."spin_no_std" or false); }
    ];
  }) [];


# end
# libc-0.2.50

  crates.libc."0.2.50" = deps: { features?(features_.libc."0.2.50" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.50";
    authors = [ "The Rust Project Developers" ];
    sha256 = "14y4zm0xp2xbj3l1kxqf2wpl58xb7hglxdbfx5dcxjlchbvk5dzs";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.50" or {});
  };
  features_.libc."0.2.50" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.50".align =
        (f.libc."0.2.50".align or false) ||
        (f.libc."0.2.50".rustc-dep-of-std or false) ||
        (libc."0.2.50"."rustc-dep-of-std" or false); }
      { "0.2.50".default = (f.libc."0.2.50".default or true); }
      { "0.2.50".rustc-std-workspace-core =
        (f.libc."0.2.50".rustc-std-workspace-core or false) ||
        (f.libc."0.2.50".rustc-dep-of-std or false) ||
        (libc."0.2.50"."rustc-dep-of-std" or false); }
      { "0.2.50".use_std =
        (f.libc."0.2.50".use_std or false) ||
        (f.libc."0.2.50".default or false) ||
        (libc."0.2.50"."default" or false); }
    ];
  }) [];


# end
# libloading-0.5.0

  crates.libloading."0.5.0" = deps: { features?(features_.libloading."0.5.0" deps {}) }: buildRustCrate {
    crateName = "libloading";
    version = "0.5.0";
    authors = [ "Simonas Kazlauskas <libloading@kazlauskas.me>" ];
    sha256 = "11vzjaka1y979aril4ggwp33p35yz2isvx9m5w88r5sdcmq6iscn";
    build = "build.rs";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."libloading"."0.5.0"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."cc"."${deps."libloading"."0.5.0"."cc"}" deps)
    ]);
  };
  features_.libloading."0.5.0" = deps: f: updateFeatures f (rec {
    cc."${deps.libloading."0.5.0".cc}".default = true;
    libloading."0.5.0".default = (f.libloading."0.5.0".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.libloading."0.5.0".winapi}"."errhandlingapi" = true; }
      { "${deps.libloading."0.5.0".winapi}"."libloaderapi" = true; }
      { "${deps.libloading."0.5.0".winapi}"."winerror" = true; }
      { "${deps.libloading."0.5.0".winapi}".default = true; }
    ];
  }) [
    (features_.cc."${deps."libloading"."0.5.0"."cc"}" deps)
    (features_.winapi."${deps."libloading"."0.5.0"."winapi"}" deps)
  ];


# end
# librocksdb-sys-5.17.2

  crates.librocksdb_sys."5.17.2" = deps: { features?(features_.librocksdb_sys."5.17.2" deps {}) }: buildRustCrate {
    crateName = "librocksdb-sys";
    version = "5.17.2";
    authors = [ "Karl Hobley <karlhobley10@gmail.com>" "Arkadiy Paronyan <arkadiy@ethcore.io>" ];
    sha256 = "11q22szx5jyksmlm1kc8jczjq1ls9cgv36rca90qcvdr96mnkf4j";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."librocksdb_sys"."5.17.2"."libc"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."bindgen"."${deps."librocksdb_sys"."5.17.2"."bindgen"}" deps)
      (crates."cc"."${deps."librocksdb_sys"."5.17.2"."cc"}" deps)
      (crates."glob"."${deps."librocksdb_sys"."5.17.2"."glob"}" deps)
    ]);
    features = mkFeatures (features."librocksdb_sys"."5.17.2" or {});
  };
  features_.librocksdb_sys."5.17.2" = deps: f: updateFeatures f (rec {
    bindgen."${deps.librocksdb_sys."5.17.2".bindgen}".default = true;
    cc = fold recursiveUpdate {} [
      { "${deps.librocksdb_sys."5.17.2".cc}"."parallel" = true; }
      { "${deps.librocksdb_sys."5.17.2".cc}".default = true; }
    ];
    glob."${deps.librocksdb_sys."5.17.2".glob}".default = true;
    libc."${deps.librocksdb_sys."5.17.2".libc}".default = true;
    librocksdb_sys = fold recursiveUpdate {} [
      { "5.17.2".default = (f.librocksdb_sys."5.17.2".default or true); }
      { "5.17.2".static =
        (f.librocksdb_sys."5.17.2".static or false) ||
        (f.librocksdb_sys."5.17.2".default or false) ||
        (librocksdb_sys."5.17.2"."default" or false); }
    ];
  }) [
    (features_.libc."${deps."librocksdb_sys"."5.17.2"."libc"}" deps)
    (features_.bindgen."${deps."librocksdb_sys"."5.17.2"."bindgen"}" deps)
    (features_.cc."${deps."librocksdb_sys"."5.17.2"."cc"}" deps)
    (features_.glob."${deps."librocksdb_sys"."5.17.2"."glob"}" deps)
  ];


# end
# linked-hash-map-0.5.2

  crates.linked_hash_map."0.5.2" = deps: { features?(features_.linked_hash_map."0.5.2" deps {}) }: buildRustCrate {
    crateName = "linked-hash-map";
    version = "0.5.2";
    authors = [ "Stepan Koltsov <stepan.koltsov@gmail.com>" "Andrew Paseltiner <apaseltiner@gmail.com>" ];
    sha256 = "17bpcphlhrxknzvikmihiqm690wwyr0zridyilh1dlxgmrxng7pd";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."linked_hash_map"."0.5.2" or {});
  };
  features_.linked_hash_map."0.5.2" = deps: f: updateFeatures f (rec {
    linked_hash_map = fold recursiveUpdate {} [
      { "0.5.2".default = (f.linked_hash_map."0.5.2".default or true); }
      { "0.5.2".heapsize =
        (f.linked_hash_map."0.5.2".heapsize or false) ||
        (f.linked_hash_map."0.5.2".heapsize_impl or false) ||
        (linked_hash_map."0.5.2"."heapsize_impl" or false); }
      { "0.5.2".serde =
        (f.linked_hash_map."0.5.2".serde or false) ||
        (f.linked_hash_map."0.5.2".serde_impl or false) ||
        (linked_hash_map."0.5.2"."serde_impl" or false); }
      { "0.5.2".serde_test =
        (f.linked_hash_map."0.5.2".serde_test or false) ||
        (f.linked_hash_map."0.5.2".serde_impl or false) ||
        (linked_hash_map."0.5.2"."serde_impl" or false); }
    ];
  }) [];


# end
# linked_hash_set-0.1.3

  crates.linked_hash_set."0.1.3" = deps: { features?(features_.linked_hash_set."0.1.3" deps {}) }: buildRustCrate {
    crateName = "linked_hash_set";
    version = "0.1.3";
    authors = [ "Alex Butler <alexheretic@gmail.com>" ];
    sha256 = "12vaq3lzmy437g3vz4vj0dnf8gv24x53wi4q6a92g6wc0brzmp3w";
    dependencies = mapFeatures features ([
      (crates."linked_hash_map"."${deps."linked_hash_set"."0.1.3"."linked_hash_map"}" deps)
    ]);
  };
  features_.linked_hash_set."0.1.3" = deps: f: updateFeatures f (rec {
    linked_hash_map."${deps.linked_hash_set."0.1.3".linked_hash_map}".default = true;
    linked_hash_set."0.1.3".default = (f.linked_hash_set."0.1.3".default or true);
  }) [
    (features_.linked_hash_map."${deps."linked_hash_set"."0.1.3"."linked_hash_map"}" deps)
  ];


# end
# log-0.4.6

  crates.log."0.4.6" = deps: { features?(features_.log."0.4.6" deps {}) }: buildRustCrate {
    crateName = "log";
    version = "0.4.6";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1nd8dl9mvc9vd6fks5d4gsxaz990xi6rzlb8ymllshmwi153vngr";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."log"."0.4.6"."cfg_if"}" deps)
    ]);
    features = mkFeatures (features."log"."0.4.6" or {});
  };
  features_.log."0.4.6" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.log."0.4.6".cfg_if}".default = true;
    log."0.4.6".default = (f.log."0.4.6".default or true);
  }) [
    (features_.cfg_if."${deps."log"."0.4.6"."cfg_if"}" deps)
  ];


# end
# memchr-2.2.0

  crates.memchr."2.2.0" = deps: { features?(features_.memchr."2.2.0" deps {}) }: buildRustCrate {
    crateName = "memchr";
    version = "2.2.0";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" "bluss" ];
    sha256 = "11vwg8iig9jyjxq3n1cq15g29ikzw5l7ar87md54k1aisjs0997p";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."memchr"."2.2.0" or {});
  };
  features_.memchr."2.2.0" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "2.2.0".default = (f.memchr."2.2.0".default or true); }
      { "2.2.0".use_std =
        (f.memchr."2.2.0".use_std or false) ||
        (f.memchr."2.2.0".default or false) ||
        (memchr."2.2.0"."default" or false); }
    ];
  }) [];


# end
# memmap-0.6.2

  crates.memmap."0.6.2" = deps: { features?(features_.memmap."0.6.2" deps {}) }: buildRustCrate {
    crateName = "memmap";
    version = "0.6.2";
    authors = [ "Dan Burkert <dan@danburkert.com>" ];
    sha256 = "0xs6wbx30fyyr51yscrhgwkmfphjgq8zan0lc2ficwxwsa7jj1cs";
    dependencies = (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."memmap"."0.6.2"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."memmap"."0.6.2"."winapi"}" deps)
    ]) else []);
  };
  features_.memmap."0.6.2" = deps: f: updateFeatures f (rec {
    libc."${deps.memmap."0.6.2".libc}".default = true;
    memmap."0.6.2".default = (f.memmap."0.6.2".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.memmap."0.6.2".winapi}"."basetsd" = true; }
      { "${deps.memmap."0.6.2".winapi}"."handleapi" = true; }
      { "${deps.memmap."0.6.2".winapi}"."memoryapi" = true; }
      { "${deps.memmap."0.6.2".winapi}"."minwindef" = true; }
      { "${deps.memmap."0.6.2".winapi}"."std" = true; }
      { "${deps.memmap."0.6.2".winapi}"."sysinfoapi" = true; }
      { "${deps.memmap."0.6.2".winapi}".default = true; }
    ];
  }) [
    (features_.libc."${deps."memmap"."0.6.2"."libc"}" deps)
    (features_.winapi."${deps."memmap"."0.6.2"."winapi"}" deps)
  ];


# end
# memoffset-0.2.1

  crates.memoffset."0.2.1" = deps: { features?(features_.memoffset."0.2.1" deps {}) }: buildRustCrate {
    crateName = "memoffset";
    version = "0.2.1";
    authors = [ "Gilad Naaman <gilad.naaman@gmail.com>" ];
    sha256 = "00vym01jk9slibq2nsiilgffp7n6k52a4q3n4dqp0xf5kzxvffcf";
  };
  features_.memoffset."0.2.1" = deps: f: updateFeatures f (rec {
    memoffset."0.2.1".default = (f.memoffset."0.2.1".default or true);
  }) [];


# end
# nix-0.7.0

  crates.nix."0.7.0" = deps: { features?(features_.nix."0.7.0" deps {}) }: buildRustCrate {
    crateName = "nix";
    version = "0.7.0";
    authors = [ "Carl Lerche <me@carllerche.com>" ];
    sha256 = "1cqghcawn2gqip1926x40lv79b6vm5ymzi4xxncy8cqk578n5nvy";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."bitflags"."${deps."nix"."0.7.0"."bitflags"}" deps)
      (crates."cfg_if"."${deps."nix"."0.7.0"."cfg_if"}" deps)
      (crates."libc"."${deps."nix"."0.7.0"."libc"}" deps)
      (crates."void"."${deps."nix"."0.7.0"."void"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."rustc_version"."${deps."nix"."0.7.0"."rustc_version"}" deps)
      (crates."semver"."${deps."nix"."0.7.0"."semver"}" deps)
    ]);
    features = mkFeatures (features."nix"."0.7.0" or {});
  };
  features_.nix."0.7.0" = deps: f: updateFeatures f (rec {
    bitflags."${deps.nix."0.7.0".bitflags}".default = true;
    cfg_if."${deps.nix."0.7.0".cfg_if}".default = true;
    libc."${deps.nix."0.7.0".libc}".default = true;
    nix."0.7.0".default = (f.nix."0.7.0".default or true);
    rustc_version."${deps.nix."0.7.0".rustc_version}".default = true;
    semver."${deps.nix."0.7.0".semver}".default = true;
    void."${deps.nix."0.7.0".void}".default = true;
  }) [
    (features_.bitflags."${deps."nix"."0.7.0"."bitflags"}" deps)
    (features_.cfg_if."${deps."nix"."0.7.0"."cfg_if"}" deps)
    (features_.libc."${deps."nix"."0.7.0"."libc"}" deps)
    (features_.void."${deps."nix"."0.7.0"."void"}" deps)
    (features_.rustc_version."${deps."nix"."0.7.0"."rustc_version"}" deps)
    (features_.semver."${deps."nix"."0.7.0"."semver"}" deps)
  ];


# end
# nodrop-0.1.13

  crates.nodrop."0.1.13" = deps: { features?(features_.nodrop."0.1.13" deps {}) }: buildRustCrate {
    crateName = "nodrop";
    version = "0.1.13";
    authors = [ "bluss" ];
    sha256 = "0gkfx6wihr9z0m8nbdhma5pyvbipznjpkzny2d4zkc05b0vnhinb";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."nodrop"."0.1.13" or {});
  };
  features_.nodrop."0.1.13" = deps: f: updateFeatures f (rec {
    nodrop = fold recursiveUpdate {} [
      { "0.1.13".default = (f.nodrop."0.1.13".default or true); }
      { "0.1.13".nodrop-union =
        (f.nodrop."0.1.13".nodrop-union or false) ||
        (f.nodrop."0.1.13".use_union or false) ||
        (nodrop."0.1.13"."use_union" or false); }
      { "0.1.13".std =
        (f.nodrop."0.1.13".std or false) ||
        (f.nodrop."0.1.13".default or false) ||
        (nodrop."0.1.13"."default" or false); }
    ];
  }) [];


# end
# nom-4.2.3

  crates.nom."4.2.3" = deps: { features?(features_.nom."4.2.3" deps {}) }: buildRustCrate {
    crateName = "nom";
    version = "4.2.3";
    authors = [ "contact@geoffroycouprie.com" ];
    sha256 = "0rg7n0nif70052wlaffmgxmmlvi6xm7zpqmzfq9d8wr9376lpn2h";
    dependencies = mapFeatures features ([
      (crates."memchr"."${deps."nom"."4.2.3"."memchr"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."version_check"."${deps."nom"."4.2.3"."version_check"}" deps)
    ]);
    features = mkFeatures (features."nom"."4.2.3" or {});
  };
  features_.nom."4.2.3" = deps: f: updateFeatures f (rec {
    memchr = fold recursiveUpdate {} [
      { "${deps.nom."4.2.3".memchr}"."use_std" =
        (f.memchr."${deps.nom."4.2.3".memchr}"."use_std" or false) ||
        (nom."4.2.3"."std" or false) ||
        (f."nom"."4.2.3"."std" or false); }
      { "${deps.nom."4.2.3".memchr}".default = (f.memchr."${deps.nom."4.2.3".memchr}".default or false); }
    ];
    nom = fold recursiveUpdate {} [
      { "4.2.3".alloc =
        (f.nom."4.2.3".alloc or false) ||
        (f.nom."4.2.3".std or false) ||
        (nom."4.2.3"."std" or false) ||
        (f.nom."4.2.3".verbose-errors or false) ||
        (nom."4.2.3"."verbose-errors" or false); }
      { "4.2.3".default = (f.nom."4.2.3".default or true); }
      { "4.2.3".lazy_static =
        (f.nom."4.2.3".lazy_static or false) ||
        (f.nom."4.2.3".regexp_macros or false) ||
        (nom."4.2.3"."regexp_macros" or false); }
      { "4.2.3".regex =
        (f.nom."4.2.3".regex or false) ||
        (f.nom."4.2.3".regexp or false) ||
        (nom."4.2.3"."regexp" or false); }
      { "4.2.3".regexp =
        (f.nom."4.2.3".regexp or false) ||
        (f.nom."4.2.3".regexp_macros or false) ||
        (nom."4.2.3"."regexp_macros" or false); }
      { "4.2.3".std =
        (f.nom."4.2.3".std or false) ||
        (f.nom."4.2.3".default or false) ||
        (nom."4.2.3"."default" or false); }
    ];
    version_check."${deps.nom."4.2.3".version_check}".default = true;
  }) [
    (features_.memchr."${deps."nom"."4.2.3"."memchr"}" deps)
    (features_.version_check."${deps."nom"."4.2.3"."version_check"}" deps)
  ];


# end
# num_cpus-1.10.0

  crates.num_cpus."1.10.0" = deps: { features?(features_.num_cpus."1.10.0" deps {}) }: buildRustCrate {
    crateName = "num_cpus";
    version = "1.10.0";
    authors = [ "Sean McArthur <sean@seanmonstar.com>" ];
    sha256 = "1411jyxy1wd8d59mv7cf6ynkvvar92czmwhb9l2c1brdkxbbiqn7";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."num_cpus"."1.10.0"."libc"}" deps)
    ]);
  };
  features_.num_cpus."1.10.0" = deps: f: updateFeatures f (rec {
    libc."${deps.num_cpus."1.10.0".libc}".default = true;
    num_cpus."1.10.0".default = (f.num_cpus."1.10.0".default or true);
  }) [
    (features_.libc."${deps."num_cpus"."1.10.0"."libc"}" deps)
  ];


# end
# peeking_take_while-0.1.2

  crates.peeking_take_while."0.1.2" = deps: { features?(features_.peeking_take_while."0.1.2" deps {}) }: buildRustCrate {
    crateName = "peeking_take_while";
    version = "0.1.2";
    authors = [ "Nick Fitzgerald <fitzgen@gmail.com>" ];
    sha256 = "1vdaxp3c73divj5rbyb2wm9pz61rg5idgh1g7bifnllf7xhw15zr";
  };
  features_.peeking_take_while."0.1.2" = deps: f: updateFeatures f (rec {
    peeking_take_while."0.1.2".default = (f.peeking_take_while."0.1.2".default or true);
  }) [];


# end
# proc-macro2-0.4.27

  crates.proc_macro2."0.4.27" = deps: { features?(features_.proc_macro2."0.4.27" deps {}) }: buildRustCrate {
    crateName = "proc-macro2";
    version = "0.4.27";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1cp4c40p3hwn2sz72ssqa62gp5n8w4gbamdqvvadzp5l7gxnq95i";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."unicode_xid"."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
    ]);
    features = mkFeatures (features."proc_macro2"."0.4.27" or {});
  };
  features_.proc_macro2."0.4.27" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "0.4.27".default = (f.proc_macro2."0.4.27".default or true); }
      { "0.4.27".proc-macro =
        (f.proc_macro2."0.4.27".proc-macro or false) ||
        (f.proc_macro2."0.4.27".default or false) ||
        (proc_macro2."0.4.27"."default" or false); }
    ];
    unicode_xid."${deps.proc_macro2."0.4.27".unicode_xid}".default = true;
  }) [
    (features_.unicode_xid."${deps."proc_macro2"."0.4.27"."unicode_xid"}" deps)
  ];


# end
# quick-error-1.2.2

  crates.quick_error."1.2.2" = deps: { features?(features_.quick_error."1.2.2" deps {}) }: buildRustCrate {
    crateName = "quick-error";
    version = "1.2.2";
    authors = [ "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" ];
    sha256 = "192a3adc5phgpibgqblsdx1b421l5yg9bjbmv552qqq9f37h60k5";
  };
  features_.quick_error."1.2.2" = deps: f: updateFeatures f (rec {
    quick_error."1.2.2".default = (f.quick_error."1.2.2".default or true);
  }) [];


# end
# quote-0.6.11

  crates.quote."0.6.11" = deps: { features?(features_.quote."0.6.11" deps {}) }: buildRustCrate {
    crateName = "quote";
    version = "0.6.11";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0agska77z58cypcq4knayzwx7r7n6m756z1cz9cp2z4sv0b846ga";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."quote"."0.6.11"."proc_macro2"}" deps)
    ]);
    features = mkFeatures (features."quote"."0.6.11" or {});
  };
  features_.quote."0.6.11" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.quote."0.6.11".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.quote."0.6.11".proc_macro2}"."proc-macro" or false) ||
        (quote."0.6.11"."proc-macro" or false) ||
        (f."quote"."0.6.11"."proc-macro" or false); }
      { "${deps.quote."0.6.11".proc_macro2}".default = (f.proc_macro2."${deps.quote."0.6.11".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "0.6.11".default = (f.quote."0.6.11".default or true); }
      { "0.6.11".proc-macro =
        (f.quote."0.6.11".proc-macro or false) ||
        (f.quote."0.6.11".default or false) ||
        (quote."0.6.11"."default" or false); }
    ];
  }) [
    (features_.proc_macro2."${deps."quote"."0.6.11"."proc_macro2"}" deps)
  ];


# end
# rand-0.6.5

  crates.rand."0.6.5" = deps: { features?(features_.rand."0.6.5" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.6.5";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0zbck48159aj8zrwzf80sd9xxh96w4f4968nshwjpysjvflimvgb";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.6.5"."rand_chacha"}" deps)
      (crates."rand_core"."${deps."rand"."0.6.5"."rand_core"}" deps)
      (crates."rand_hc"."${deps."rand"."0.6.5"."rand_hc"}" deps)
      (crates."rand_isaac"."${deps."rand"."0.6.5"."rand_isaac"}" deps)
      (crates."rand_jitter"."${deps."rand"."0.6.5"."rand_jitter"}" deps)
      (crates."rand_pcg"."${deps."rand"."0.6.5"."rand_pcg"}" deps)
      (crates."rand_xorshift"."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    ]
      ++ (if features.rand."0.6.5".rand_os or false then [ (crates.rand_os."${deps."rand"."0.6.5".rand_os}" deps) ] else []))
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.6.5"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand"."0.6.5"."winapi"}" deps)
    ]) else []);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand"."0.6.5"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand"."0.6.5" or {});
  };
  features_.rand."0.6.5" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand."0.6.5".autocfg}".default = true;
    libc."${deps.rand."0.6.5".libc}".default = (f.libc."${deps.rand."0.6.5".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.6.5".alloc =
        (f.rand."0.6.5".alloc or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".default = (f.rand."0.6.5".default or true); }
      { "0.6.5".packed_simd =
        (f.rand."0.6.5".packed_simd or false) ||
        (f.rand."0.6.5".simd_support or false) ||
        (rand."0.6.5"."simd_support" or false); }
      { "0.6.5".rand_os =
        (f.rand."0.6.5".rand_os or false) ||
        (f.rand."0.6.5".std or false) ||
        (rand."0.6.5"."std" or false); }
      { "0.6.5".simd_support =
        (f.rand."0.6.5".simd_support or false) ||
        (f.rand."0.6.5".nightly or false) ||
        (rand."0.6.5"."nightly" or false); }
      { "0.6.5".std =
        (f.rand."0.6.5".std or false) ||
        (f.rand."0.6.5".default or false) ||
        (rand."0.6.5"."default" or false); }
    ];
    rand_chacha."${deps.rand."0.6.5".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."alloc" or false) ||
        (rand."0.6.5"."alloc" or false) ||
        (f."rand"."0.6.5"."alloc" or false); }
      { "${deps.rand."0.6.5".rand_core}"."serde1" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.6.5".rand_core}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.6.5".rand_hc}".default = true;
    rand_isaac = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_isaac}"."serde1" =
        (f.rand_isaac."${deps.rand."0.6.5".rand_isaac}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_isaac}".default = true; }
    ];
    rand_jitter = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_jitter}"."std" =
        (f.rand_jitter."${deps.rand."0.6.5".rand_jitter}"."std" or false) ||
        (rand."0.6.5"."std" or false) ||
        (f."rand"."0.6.5"."std" or false); }
      { "${deps.rand."0.6.5".rand_jitter}".default = true; }
    ];
    rand_os = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_os}"."stdweb" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."stdweb" or false) ||
        (rand."0.6.5"."stdweb" or false) ||
        (f."rand"."0.6.5"."stdweb" or false); }
      { "${deps.rand."0.6.5".rand_os}"."wasm-bindgen" =
        (f.rand_os."${deps.rand."0.6.5".rand_os}"."wasm-bindgen" or false) ||
        (rand."0.6.5"."wasm-bindgen" or false) ||
        (f."rand"."0.6.5"."wasm-bindgen" or false); }
      { "${deps.rand."0.6.5".rand_os}".default = true; }
    ];
    rand_pcg."${deps.rand."0.6.5".rand_pcg}".default = true;
    rand_xorshift = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".rand_xorshift}"."serde1" =
        (f.rand_xorshift."${deps.rand."0.6.5".rand_xorshift}"."serde1" or false) ||
        (rand."0.6.5"."serde1" or false) ||
        (f."rand"."0.6.5"."serde1" or false); }
      { "${deps.rand."0.6.5".rand_xorshift}".default = true; }
    ];
    winapi = fold recursiveUpdate {} [
      { "${deps.rand."0.6.5".winapi}"."minwindef" = true; }
      { "${deps.rand."0.6.5".winapi}"."ntsecapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."profileapi" = true; }
      { "${deps.rand."0.6.5".winapi}"."winnt" = true; }
      { "${deps.rand."0.6.5".winapi}".default = true; }
    ];
  }) [
    (features_.rand_chacha."${deps."rand"."0.6.5"."rand_chacha"}" deps)
    (features_.rand_core."${deps."rand"."0.6.5"."rand_core"}" deps)
    (features_.rand_hc."${deps."rand"."0.6.5"."rand_hc"}" deps)
    (features_.rand_isaac."${deps."rand"."0.6.5"."rand_isaac"}" deps)
    (features_.rand_jitter."${deps."rand"."0.6.5"."rand_jitter"}" deps)
    (features_.rand_os."${deps."rand"."0.6.5"."rand_os"}" deps)
    (features_.rand_pcg."${deps."rand"."0.6.5"."rand_pcg"}" deps)
    (features_.rand_xorshift."${deps."rand"."0.6.5"."rand_xorshift"}" deps)
    (features_.autocfg."${deps."rand"."0.6.5"."autocfg"}" deps)
    (features_.libc."${deps."rand"."0.6.5"."libc"}" deps)
    (features_.winapi."${deps."rand"."0.6.5"."winapi"}" deps)
  ];


# end
# rand_chacha-0.1.1

  crates.rand_chacha."0.1.1" = deps: { features?(features_.rand_chacha."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0xnxm4mjd7wjnh18zxc1yickw58axbycp35ciraplqdfwn1gffwi";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
    ]);
  };
  features_.rand_chacha."0.1.1" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_chacha."0.1.1".autocfg}".default = true;
    rand_chacha."0.1.1".default = (f.rand_chacha."0.1.1".default or true);
    rand_core."${deps.rand_chacha."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_chacha."0.1.1".rand_core}".default or false);
  }) [
    (features_.rand_core."${deps."rand_chacha"."0.1.1"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_chacha"."0.1.1"."autocfg"}" deps)
  ];


# end
# rand_core-0.3.1

  crates.rand_core."0.3.1" = deps: { features?(features_.rand_core."0.3.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.3.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0q0ssgpj9x5a6fda83nhmfydy7a6c0wvxm0jhncsmjx8qp8gw91m";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_core"."0.3.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_core"."0.3.1" or {});
  };
  features_.rand_core."0.3.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_core."0.3.1".rand_core}"."alloc" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."alloc" or false) ||
        (rand_core."0.3.1"."alloc" or false) ||
        (f."rand_core"."0.3.1"."alloc" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."serde1" or false) ||
        (rand_core."0.3.1"."serde1" or false) ||
        (f."rand_core"."0.3.1"."serde1" or false); }
      { "${deps.rand_core."0.3.1".rand_core}"."std" =
        (f.rand_core."${deps.rand_core."0.3.1".rand_core}"."std" or false) ||
        (rand_core."0.3.1"."std" or false) ||
        (f."rand_core"."0.3.1"."std" or false); }
      { "${deps.rand_core."0.3.1".rand_core}".default = true; }
      { "0.3.1".default = (f.rand_core."0.3.1".default or true); }
      { "0.3.1".std =
        (f.rand_core."0.3.1".std or false) ||
        (f.rand_core."0.3.1".default or false) ||
        (rand_core."0.3.1"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_core"."0.3.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.4.0

  crates.rand_core."0.4.0" = deps: { features?(features_.rand_core."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.4.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0wb5iwhffibj0pnpznhv1g3i7h1fnhz64s3nz74fz6vsm3q6q3br";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."rand_core"."0.4.0" or {});
  };
  features_.rand_core."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "0.4.0".alloc =
        (f.rand_core."0.4.0".alloc or false) ||
        (f.rand_core."0.4.0".std or false) ||
        (rand_core."0.4.0"."std" or false); }
      { "0.4.0".default = (f.rand_core."0.4.0".default or true); }
      { "0.4.0".serde =
        (f.rand_core."0.4.0".serde or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
      { "0.4.0".serde_derive =
        (f.rand_core."0.4.0".serde_derive or false) ||
        (f.rand_core."0.4.0".serde1 or false) ||
        (rand_core."0.4.0"."serde1" or false); }
    ];
  }) [];


# end
# rand_hc-0.1.0

  crates.rand_hc."0.1.0" = deps: { features?(features_.rand_hc."0.1.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.1.0";
    authors = [ "The Rand Project Developers" ];
    sha256 = "05agb75j87yp7y1zk8yf7bpm66hc0673r3dlypn0kazynr6fdgkz";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.1.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.1.0".rand_core}".default = (f.rand_core."${deps.rand_hc."0.1.0".rand_core}".default or false);
    rand_hc."0.1.0".default = (f.rand_hc."0.1.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.1.0"."rand_core"}" deps)
  ];


# end
# rand_isaac-0.1.1

  crates.rand_isaac."0.1.1" = deps: { features?(features_.rand_isaac."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_isaac";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "10hhdh5b5sa03s6b63y9bafm956jwilx41s71jbrzl63ccx8lxdq";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_isaac"."0.1.1" or {});
  };
  features_.rand_isaac."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_isaac."0.1.1".rand_core}"."serde1" =
        (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}"."serde1" or false) ||
        (rand_isaac."0.1.1"."serde1" or false) ||
        (f."rand_isaac"."0.1.1"."serde1" or false); }
      { "${deps.rand_isaac."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_isaac."0.1.1".rand_core}".default or false); }
    ];
    rand_isaac = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_isaac."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_isaac."0.1.1".serde or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_isaac."0.1.1".serde_derive or false) ||
        (f.rand_isaac."0.1.1".serde1 or false) ||
        (rand_isaac."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_isaac"."0.1.1"."rand_core"}" deps)
  ];


# end
# rand_jitter-0.1.3

  crates.rand_jitter."0.1.3" = deps: { features?(features_.rand_jitter."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_jitter";
    version = "0.1.3";
    authors = [ "The Rand Project Developers" ];
    sha256 = "1cb4q73rmh1inlx3liy6rabapcqh6p6c1plsd2lxw6dmi67d1qc3";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_jitter"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if kernel == "darwin" || kernel == "ios" then mapFeatures features ([
      (crates."libc"."${deps."rand_jitter"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_jitter"."0.1.3"."winapi"}" deps)
    ]) else []);
    features = mkFeatures (features."rand_jitter"."0.1.3" or {});
  };
  features_.rand_jitter."0.1.3" = deps: f: updateFeatures f (rec {
    libc."${deps.rand_jitter."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.3".rand_core}"."std" =
        (f.rand_core."${deps.rand_jitter."0.1.3".rand_core}"."std" or false) ||
        (rand_jitter."0.1.3"."std" or false) ||
        (f."rand_jitter"."0.1.3"."std" or false); }
      { "${deps.rand_jitter."0.1.3".rand_core}".default = true; }
    ];
    rand_jitter."0.1.3".default = (f.rand_jitter."0.1.3".default or true);
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_jitter."0.1.3".winapi}"."profileapi" = true; }
      { "${deps.rand_jitter."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_jitter"."0.1.3"."rand_core"}" deps)
    (features_.libc."${deps."rand_jitter"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_jitter"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_os-0.1.3

  crates.rand_os."0.1.3" = deps: { features?(features_.rand_os."0.1.3" deps {}) }: buildRustCrate {
    crateName = "rand_os";
    version = "0.1.3";
    authors = [ "The Rand Project Developers" ];
    sha256 = "0ywwspizgs9g8vzn6m5ix9yg36n15119d6n792h7mk4r5vs0ww4j";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    ])
      ++ (if abi == "sgx" then mapFeatures features ([
      (crates."rdrand"."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    ]) else [])
      ++ (if kernel == "cloudabi" then mapFeatures features ([
      (crates."cloudabi"."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    ]) else [])
      ++ (if kernel == "fuchsia" then mapFeatures features ([
      (crates."fuchsia_cprng"."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand_os"."0.1.3"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."rand_os"."0.1.3"."winapi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
  };
  features_.rand_os."0.1.3" = deps: f: updateFeatures f (rec {
    cloudabi."${deps.rand_os."0.1.3".cloudabi}".default = true;
    fuchsia_cprng."${deps.rand_os."0.1.3".fuchsia_cprng}".default = true;
    libc."${deps.rand_os."0.1.3".libc}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".rand_core}"."std" = true; }
      { "${deps.rand_os."0.1.3".rand_core}".default = true; }
    ];
    rand_os."0.1.3".default = (f.rand_os."0.1.3".default or true);
    rdrand."${deps.rand_os."0.1.3".rdrand}".default = true;
    winapi = fold recursiveUpdate {} [
      { "${deps.rand_os."0.1.3".winapi}"."minwindef" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."ntsecapi" = true; }
      { "${deps.rand_os."0.1.3".winapi}"."winnt" = true; }
      { "${deps.rand_os."0.1.3".winapi}".default = true; }
    ];
  }) [
    (features_.rand_core."${deps."rand_os"."0.1.3"."rand_core"}" deps)
    (features_.rdrand."${deps."rand_os"."0.1.3"."rdrand"}" deps)
    (features_.cloudabi."${deps."rand_os"."0.1.3"."cloudabi"}" deps)
    (features_.fuchsia_cprng."${deps."rand_os"."0.1.3"."fuchsia_cprng"}" deps)
    (features_.libc."${deps."rand_os"."0.1.3"."libc"}" deps)
    (features_.winapi."${deps."rand_os"."0.1.3"."winapi"}" deps)
  ];


# end
# rand_pcg-0.1.2

  crates.rand_pcg."0.1.2" = deps: { features?(features_.rand_pcg."0.1.2" deps {}) }: buildRustCrate {
    crateName = "rand_pcg";
    version = "0.1.2";
    authors = [ "The Rand Project Developers" ];
    sha256 = "04qgi2ai2z42li5h4aawvxbpnlqyjfnipz9d6k73mdnl6p1xq938";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    ]);

    buildDependencies = mapFeatures features ([
      (crates."autocfg"."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
    ]);
    features = mkFeatures (features."rand_pcg"."0.1.2" or {});
  };
  features_.rand_pcg."0.1.2" = deps: f: updateFeatures f (rec {
    autocfg."${deps.rand_pcg."0.1.2".autocfg}".default = true;
    rand_core."${deps.rand_pcg."0.1.2".rand_core}".default = true;
    rand_pcg = fold recursiveUpdate {} [
      { "0.1.2".default = (f.rand_pcg."0.1.2".default or true); }
      { "0.1.2".serde =
        (f.rand_pcg."0.1.2".serde or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
      { "0.1.2".serde_derive =
        (f.rand_pcg."0.1.2".serde_derive or false) ||
        (f.rand_pcg."0.1.2".serde1 or false) ||
        (rand_pcg."0.1.2"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_pcg"."0.1.2"."rand_core"}" deps)
    (features_.autocfg."${deps."rand_pcg"."0.1.2"."autocfg"}" deps)
  ];


# end
# rand_xorshift-0.1.1

  crates.rand_xorshift."0.1.1" = deps: { features?(features_.rand_xorshift."0.1.1" deps {}) }: buildRustCrate {
    crateName = "rand_xorshift";
    version = "0.1.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    sha256 = "0v365c4h4lzxwz5k5kp9m0661s0sss7ylv74if0xb4svis9sswnn";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_xorshift"."0.1.1" or {});
  };
  features_.rand_xorshift."0.1.1" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default = (f.rand_core."${deps.rand_xorshift."0.1.1".rand_core}".default or false);
    rand_xorshift = fold recursiveUpdate {} [
      { "0.1.1".default = (f.rand_xorshift."0.1.1".default or true); }
      { "0.1.1".serde =
        (f.rand_xorshift."0.1.1".serde or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
      { "0.1.1".serde_derive =
        (f.rand_xorshift."0.1.1".serde_derive or false) ||
        (f.rand_xorshift."0.1.1".serde1 or false) ||
        (rand_xorshift."0.1.1"."serde1" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rand_xorshift"."0.1.1"."rand_core"}" deps)
  ];


# end
# rayon-1.0.3

  crates.rayon."1.0.3" = deps: { features?(features_.rayon."1.0.3" deps {}) }: buildRustCrate {
    crateName = "rayon";
    version = "1.0.3";
    authors = [ "Niko Matsakis <niko@alum.mit.edu>" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "0bmwk0l5nbx20a5x16dhrgrmkh3m40v6i0qs2gi2iqimlszyhq93";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."rayon"."1.0.3"."crossbeam_deque"}" deps)
      (crates."either"."${deps."rayon"."1.0.3"."either"}" deps)
      (crates."rayon_core"."${deps."rayon"."1.0.3"."rayon_core"}" deps)
    ]);
  };
  features_.rayon."1.0.3" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.rayon."1.0.3".crossbeam_deque}".default = true;
    either."${deps.rayon."1.0.3".either}".default = (f.either."${deps.rayon."1.0.3".either}".default or false);
    rayon."1.0.3".default = (f.rayon."1.0.3".default or true);
    rayon_core."${deps.rayon."1.0.3".rayon_core}".default = true;
  }) [
    (features_.crossbeam_deque."${deps."rayon"."1.0.3"."crossbeam_deque"}" deps)
    (features_.either."${deps."rayon"."1.0.3"."either"}" deps)
    (features_.rayon_core."${deps."rayon"."1.0.3"."rayon_core"}" deps)
  ];


# end
# rayon-core-1.4.1

  crates.rayon_core."1.4.1" = deps: { features?(features_.rayon_core."1.4.1" deps {}) }: buildRustCrate {
    crateName = "rayon-core";
    version = "1.4.1";
    authors = [ "Niko Matsakis <niko@alum.mit.edu>" "Josh Stone <cuviper@gmail.com>" ];
    sha256 = "01xf3mwmmji7yaarrpzpqjhz928ajxkwmjczbwmnpy39y95m4fbn";
    build = "build.rs";
    dependencies = mapFeatures features ([
      (crates."crossbeam_deque"."${deps."rayon_core"."1.4.1"."crossbeam_deque"}" deps)
      (crates."lazy_static"."${deps."rayon_core"."1.4.1"."lazy_static"}" deps)
      (crates."libc"."${deps."rayon_core"."1.4.1"."libc"}" deps)
      (crates."num_cpus"."${deps."rayon_core"."1.4.1"."num_cpus"}" deps)
    ]);
  };
  features_.rayon_core."1.4.1" = deps: f: updateFeatures f (rec {
    crossbeam_deque."${deps.rayon_core."1.4.1".crossbeam_deque}".default = true;
    lazy_static."${deps.rayon_core."1.4.1".lazy_static}".default = true;
    libc."${deps.rayon_core."1.4.1".libc}".default = true;
    num_cpus."${deps.rayon_core."1.4.1".num_cpus}".default = true;
    rayon_core."1.4.1".default = (f.rayon_core."1.4.1".default or true);
  }) [
    (features_.crossbeam_deque."${deps."rayon_core"."1.4.1"."crossbeam_deque"}" deps)
    (features_.lazy_static."${deps."rayon_core"."1.4.1"."lazy_static"}" deps)
    (features_.libc."${deps."rayon_core"."1.4.1"."libc"}" deps)
    (features_.num_cpus."${deps."rayon_core"."1.4.1"."num_cpus"}" deps)
  ];


# end
# rdrand-0.4.0

  crates.rdrand."0.4.0" = deps: { features?(features_.rdrand."0.4.0" deps {}) }: buildRustCrate {
    crateName = "rdrand";
    version = "0.4.0";
    authors = [ "Simonas Kazlauskas <rdrand@kazlauskas.me>" ];
    sha256 = "15hrcasn0v876wpkwab1dwbk9kvqwrb3iv4y4dibb6yxnfvzwajk";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rdrand"."0.4.0"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rdrand"."0.4.0" or {});
  };
  features_.rdrand."0.4.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rdrand."0.4.0".rand_core}".default = (f.rand_core."${deps.rdrand."0.4.0".rand_core}".default or false);
    rdrand = fold recursiveUpdate {} [
      { "0.4.0".default = (f.rdrand."0.4.0".default or true); }
      { "0.4.0".std =
        (f.rdrand."0.4.0".std or false) ||
        (f.rdrand."0.4.0".default or false) ||
        (rdrand."0.4.0"."default" or false); }
    ];
  }) [
    (features_.rand_core."${deps."rdrand"."0.4.0"."rand_core"}" deps)
  ];


# end
# redox_syscall-0.1.51

  crates.redox_syscall."0.1.51" = deps: { features?(features_.redox_syscall."0.1.51" deps {}) }: buildRustCrate {
    crateName = "redox_syscall";
    version = "0.1.51";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "1a61cv7yydx64vpyvzr0z0hwzdvy4gcvcnfc6k70zpkngj5sz3ip";
    libName = "syscall";
  };
  features_.redox_syscall."0.1.51" = deps: f: updateFeatures f (rec {
    redox_syscall."0.1.51".default = (f.redox_syscall."0.1.51".default or true);
  }) [];


# end
# redox_termios-0.1.1

  crates.redox_termios."0.1.1" = deps: { features?(features_.redox_termios."0.1.1" deps {}) }: buildRustCrate {
    crateName = "redox_termios";
    version = "0.1.1";
    authors = [ "Jeremy Soller <jackpot51@gmail.com>" ];
    sha256 = "04s6yyzjca552hdaqlvqhp3vw0zqbc304md5czyd3axh56iry8wh";
    libPath = "src/lib.rs";
    dependencies = mapFeatures features ([
      (crates."redox_syscall"."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
    ]);
  };
  features_.redox_termios."0.1.1" = deps: f: updateFeatures f (rec {
    redox_syscall."${deps.redox_termios."0.1.1".redox_syscall}".default = true;
    redox_termios."0.1.1".default = (f.redox_termios."0.1.1".default or true);
  }) [
    (features_.redox_syscall."${deps."redox_termios"."0.1.1"."redox_syscall"}" deps)
  ];


# end
# regex-1.1.2

  crates.regex."1.1.2" = deps: { features?(features_.regex."1.1.2" deps {}) }: buildRustCrate {
    crateName = "regex";
    version = "1.1.2";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1c9nb031z1vw5l6lzfkfra2mah9hb2s1wgq9f1lmgcbkiiprj9xd";
    dependencies = mapFeatures features ([
      (crates."aho_corasick"."${deps."regex"."1.1.2"."aho_corasick"}" deps)
      (crates."memchr"."${deps."regex"."1.1.2"."memchr"}" deps)
      (crates."regex_syntax"."${deps."regex"."1.1.2"."regex_syntax"}" deps)
      (crates."thread_local"."${deps."regex"."1.1.2"."thread_local"}" deps)
      (crates."utf8_ranges"."${deps."regex"."1.1.2"."utf8_ranges"}" deps)
    ]);
    features = mkFeatures (features."regex"."1.1.2" or {});
  };
  features_.regex."1.1.2" = deps: f: updateFeatures f (rec {
    aho_corasick."${deps.regex."1.1.2".aho_corasick}".default = true;
    memchr."${deps.regex."1.1.2".memchr}".default = true;
    regex = fold recursiveUpdate {} [
      { "1.1.2".default = (f.regex."1.1.2".default or true); }
      { "1.1.2".pattern =
        (f.regex."1.1.2".pattern or false) ||
        (f.regex."1.1.2".unstable or false) ||
        (regex."1.1.2"."unstable" or false); }
      { "1.1.2".use_std =
        (f.regex."1.1.2".use_std or false) ||
        (f.regex."1.1.2".default or false) ||
        (regex."1.1.2"."default" or false); }
    ];
    regex_syntax."${deps.regex."1.1.2".regex_syntax}".default = true;
    thread_local."${deps.regex."1.1.2".thread_local}".default = true;
    utf8_ranges."${deps.regex."1.1.2".utf8_ranges}".default = true;
  }) [
    (features_.aho_corasick."${deps."regex"."1.1.2"."aho_corasick"}" deps)
    (features_.memchr."${deps."regex"."1.1.2"."memchr"}" deps)
    (features_.regex_syntax."${deps."regex"."1.1.2"."regex_syntax"}" deps)
    (features_.thread_local."${deps."regex"."1.1.2"."thread_local"}" deps)
    (features_.utf8_ranges."${deps."regex"."1.1.2"."utf8_ranges"}" deps)
  ];


# end
# regex-syntax-0.3.9

  crates.regex_syntax."0.3.9" = deps: { features?(features_.regex_syntax."0.3.9" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.3.9";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1mzhphkbwppwd1zam2jkgjk550cqgf6506i87bw2yzrvcsraiw7m";
  };
  features_.regex_syntax."0.3.9" = deps: f: updateFeatures f (rec {
    regex_syntax."0.3.9".default = (f.regex_syntax."0.3.9".default or true);
  }) [];


# end
# regex-syntax-0.6.5

  crates.regex_syntax."0.6.5" = deps: { features?(features_.regex_syntax."0.6.5" deps {}) }: buildRustCrate {
    crateName = "regex-syntax";
    version = "0.6.5";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0aaaba1fan2qfyc31wzdmgmbmyirc27zgcbz41ba5wm1lb2d8kli";
    dependencies = mapFeatures features ([
      (crates."ucd_util"."${deps."regex_syntax"."0.6.5"."ucd_util"}" deps)
    ]);
  };
  features_.regex_syntax."0.6.5" = deps: f: updateFeatures f (rec {
    regex_syntax."0.6.5".default = (f.regex_syntax."0.6.5".default or true);
    ucd_util."${deps.regex_syntax."0.6.5".ucd_util}".default = true;
  }) [
    (features_.ucd_util."${deps."regex_syntax"."0.6.5"."ucd_util"}" deps)
  ];


# end
# rocksdb-0.12.1

  crates.rocksdb."0.12.1" = deps: { features?(features_.rocksdb."0.12.1" deps {}) }: buildRustCrate {
    crateName = "rocksdb";
    version = "0.12.1";
    authors = [ "Tyler Neely <t@jujit.su>" "David Greenberg <dsg123456789@gmail.com>" ];
    sha256 = "18yrkw2jgiwaa2i78ffjm0lxyl2kdx2r3n4qqsj79cb62max78s0";
    dependencies = mapFeatures features ([
      (crates."libc"."${deps."rocksdb"."0.12.1"."libc"}" deps)
      (crates."librocksdb_sys"."${deps."rocksdb"."0.12.1"."librocksdb_sys"}" deps)
    ]);
    features = mkFeatures (features."rocksdb"."0.12.1" or {});
  };
  features_.rocksdb."0.12.1" = deps: f: updateFeatures f (rec {
    libc."${deps.rocksdb."0.12.1".libc}".default = true;
    librocksdb_sys = fold recursiveUpdate {} [
      { "${deps.rocksdb."0.12.1".librocksdb_sys}"."bzip2" =
        (f.librocksdb_sys."${deps.rocksdb."0.12.1".librocksdb_sys}"."bzip2" or false) ||
        (rocksdb."0.12.1"."bzip2" or false) ||
        (f."rocksdb"."0.12.1"."bzip2" or false); }
      { "${deps.rocksdb."0.12.1".librocksdb_sys}"."lz4" =
        (f.librocksdb_sys."${deps.rocksdb."0.12.1".librocksdb_sys}"."lz4" or false) ||
        (rocksdb."0.12.1"."lz4" or false) ||
        (f."rocksdb"."0.12.1"."lz4" or false); }
      { "${deps.rocksdb."0.12.1".librocksdb_sys}"."snappy" =
        (f.librocksdb_sys."${deps.rocksdb."0.12.1".librocksdb_sys}"."snappy" or false) ||
        (rocksdb."0.12.1"."snappy" or false) ||
        (f."rocksdb"."0.12.1"."snappy" or false); }
      { "${deps.rocksdb."0.12.1".librocksdb_sys}"."zlib" =
        (f.librocksdb_sys."${deps.rocksdb."0.12.1".librocksdb_sys}"."zlib" or false) ||
        (rocksdb."0.12.1"."zlib" or false) ||
        (f."rocksdb"."0.12.1"."zlib" or false); }
      { "${deps.rocksdb."0.12.1".librocksdb_sys}"."zstd" =
        (f.librocksdb_sys."${deps.rocksdb."0.12.1".librocksdb_sys}"."zstd" or false) ||
        (rocksdb."0.12.1"."zstd" or false) ||
        (f."rocksdb"."0.12.1"."zstd" or false); }
      { "${deps.rocksdb."0.12.1".librocksdb_sys}".default = true; }
    ];
    rocksdb = fold recursiveUpdate {} [
      { "0.12.1".bzip2 =
        (f.rocksdb."0.12.1".bzip2 or false) ||
        (f.rocksdb."0.12.1".default or false) ||
        (rocksdb."0.12.1"."default" or false); }
      { "0.12.1".default = (f.rocksdb."0.12.1".default or true); }
      { "0.12.1".lz4 =
        (f.rocksdb."0.12.1".lz4 or false) ||
        (f.rocksdb."0.12.1".default or false) ||
        (rocksdb."0.12.1"."default" or false); }
      { "0.12.1".snappy =
        (f.rocksdb."0.12.1".snappy or false) ||
        (f.rocksdb."0.12.1".default or false) ||
        (rocksdb."0.12.1"."default" or false); }
      { "0.12.1".zlib =
        (f.rocksdb."0.12.1".zlib or false) ||
        (f.rocksdb."0.12.1".default or false) ||
        (rocksdb."0.12.1"."default" or false); }
      { "0.12.1".zstd =
        (f.rocksdb."0.12.1".zstd or false) ||
        (f.rocksdb."0.12.1".default or false) ||
        (rocksdb."0.12.1"."default" or false); }
    ];
  }) [
    (features_.libc."${deps."rocksdb"."0.12.1"."libc"}" deps)
    (features_.librocksdb_sys."${deps."rocksdb"."0.12.1"."librocksdb_sys"}" deps)
  ];


# end
# rustc-demangle-0.1.13

  crates.rustc_demangle."0.1.13" = deps: { features?(features_.rustc_demangle."0.1.13" deps {}) }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.13";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0sr6cr02araqnlqwc5ghvnafjmkw11vzjswqaz757lvyrcl8xcy6";
  };
  features_.rustc_demangle."0.1.13" = deps: f: updateFeatures f (rec {
    rustc_demangle."0.1.13".default = (f.rustc_demangle."0.1.13".default or true);
  }) [];


# end
# rustc_version-0.1.7

  crates.rustc_version."0.1.7" = deps: { features?(features_.rustc_version."0.1.7" deps {}) }: buildRustCrate {
    crateName = "rustc_version";
    version = "0.1.7";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "0plm9pbyvcwfibd0kbhzil9xmr1bvqi8fgwlfw0x4vali8s6s99p";
    dependencies = mapFeatures features ([
      (crates."semver"."${deps."rustc_version"."0.1.7"."semver"}" deps)
    ]);
  };
  features_.rustc_version."0.1.7" = deps: f: updateFeatures f (rec {
    rustc_version."0.1.7".default = (f.rustc_version."0.1.7".default or true);
    semver."${deps.rustc_version."0.1.7".semver}".default = true;
  }) [
    (features_.semver."${deps."rustc_version"."0.1.7"."semver"}" deps)
  ];


# end
# scopeguard-0.3.3

  crates.scopeguard."0.3.3" = deps: { features?(features_.scopeguard."0.3.3" deps {}) }: buildRustCrate {
    crateName = "scopeguard";
    version = "0.3.3";
    authors = [ "bluss" ];
    sha256 = "0i1l013csrqzfz6c68pr5pi01hg5v5yahq8fsdmaxy6p8ygsjf3r";
    features = mkFeatures (features."scopeguard"."0.3.3" or {});
  };
  features_.scopeguard."0.3.3" = deps: f: updateFeatures f (rec {
    scopeguard = fold recursiveUpdate {} [
      { "0.3.3".default = (f.scopeguard."0.3.3".default or true); }
      { "0.3.3".use_std =
        (f.scopeguard."0.3.3".use_std or false) ||
        (f.scopeguard."0.3.3".default or false) ||
        (scopeguard."0.3.3"."default" or false); }
    ];
  }) [];


# end
# semver-0.1.20

  crates.semver."0.1.20" = deps: { features?(features_.semver."0.1.20" deps {}) }: buildRustCrate {
    crateName = "semver";
    version = "0.1.20";
    authors = [ "The Rust Project Developers" ];
    sha256 = "05cdig0071hls2k8lxbqmyqpl0zjmc53i2d43mwzps033b8njh4n";
  };
  features_.semver."0.1.20" = deps: f: updateFeatures f (rec {
    semver."0.1.20".default = (f.semver."0.1.20".default or true);
  }) [];


# end
# serde-1.0.89

  crates.serde."1.0.89" = deps: { features?(features_.serde."1.0.89" deps {}) }: buildRustCrate {
    crateName = "serde";
    version = "1.0.89";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "14pidc6skkm92vhp431wi1aam5vv5g6rmsimik38wzb0qy72c71g";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."serde"."1.0.89" or {});
  };
  features_.serde."1.0.89" = deps: f: updateFeatures f (rec {
    serde = fold recursiveUpdate {} [
      { "1.0.89".default = (f.serde."1.0.89".default or true); }
      { "1.0.89".serde_derive =
        (f.serde."1.0.89".serde_derive or false) ||
        (f.serde."1.0.89".derive or false) ||
        (serde."1.0.89"."derive" or false); }
      { "1.0.89".std =
        (f.serde."1.0.89".std or false) ||
        (f.serde."1.0.89".default or false) ||
        (serde."1.0.89"."default" or false); }
      { "1.0.89".unstable =
        (f.serde."1.0.89".unstable or false) ||
        (f.serde."1.0.89".alloc or false) ||
        (serde."1.0.89"."alloc" or false); }
    ];
  }) [];


# end
# serde_derive-1.0.89

  crates.serde_derive."1.0.89" = deps: { features?(features_.serde_derive."1.0.89" deps {}) }: buildRustCrate {
    crateName = "serde_derive";
    version = "1.0.89";
    authors = [ "Erick Tryzelaar <erick.tryzelaar@gmail.com>" "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0wxbxq9sccrd939pfnrgfzykkwl9gag2yf7vxhg2c2p9kx36d3wm";
    procMacro = true;
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."serde_derive"."1.0.89"."proc_macro2"}" deps)
      (crates."quote"."${deps."serde_derive"."1.0.89"."quote"}" deps)
      (crates."syn"."${deps."serde_derive"."1.0.89"."syn"}" deps)
    ]);
    features = mkFeatures (features."serde_derive"."1.0.89" or {});
  };
  features_.serde_derive."1.0.89" = deps: f: updateFeatures f (rec {
    proc_macro2."${deps.serde_derive."1.0.89".proc_macro2}".default = true;
    quote."${deps.serde_derive."1.0.89".quote}".default = true;
    serde_derive."1.0.89".default = (f.serde_derive."1.0.89".default or true);
    syn = fold recursiveUpdate {} [
      { "${deps.serde_derive."1.0.89".syn}"."visit" = true; }
      { "${deps.serde_derive."1.0.89".syn}".default = true; }
    ];
  }) [
    (features_.proc_macro2."${deps."serde_derive"."1.0.89"."proc_macro2"}" deps)
    (features_.quote."${deps."serde_derive"."1.0.89"."quote"}" deps)
    (features_.syn."${deps."serde_derive"."1.0.89"."syn"}" deps)
  ];


# end
# strsim-0.7.0

  crates.strsim."0.7.0" = deps: { features?(features_.strsim."0.7.0" deps {}) }: buildRustCrate {
    crateName = "strsim";
    version = "0.7.0";
    authors = [ "Danny Guo <dannyguo91@gmail.com>" ];
    sha256 = "0fy0k5f2705z73mb3x9459bpcvrx4ky8jpr4zikcbiwan4bnm0iv";
  };
  features_.strsim."0.7.0" = deps: f: updateFeatures f (rec {
    strsim."0.7.0".default = (f.strsim."0.7.0".default or true);
  }) [];


# end
# syn-0.15.29

  crates.syn."0.15.29" = deps: { features?(features_.syn."0.15.29" deps {}) }: buildRustCrate {
    crateName = "syn";
    version = "0.15.29";
    authors = [ "David Tolnay <dtolnay@gmail.com>" ];
    sha256 = "0wrd6awgc6f1iwfn2v9fvwyd2yddgxdjv9s106kvwg1ljbw3fajw";
    dependencies = mapFeatures features ([
      (crates."proc_macro2"."${deps."syn"."0.15.29"."proc_macro2"}" deps)
      (crates."unicode_xid"."${deps."syn"."0.15.29"."unicode_xid"}" deps)
    ]
      ++ (if features.syn."0.15.29".quote or false then [ (crates.quote."${deps."syn"."0.15.29".quote}" deps) ] else []));
    features = mkFeatures (features."syn"."0.15.29" or {});
  };
  features_.syn."0.15.29" = deps: f: updateFeatures f (rec {
    proc_macro2 = fold recursiveUpdate {} [
      { "${deps.syn."0.15.29".proc_macro2}"."proc-macro" =
        (f.proc_macro2."${deps.syn."0.15.29".proc_macro2}"."proc-macro" or false) ||
        (syn."0.15.29"."proc-macro" or false) ||
        (f."syn"."0.15.29"."proc-macro" or false); }
      { "${deps.syn."0.15.29".proc_macro2}".default = (f.proc_macro2."${deps.syn."0.15.29".proc_macro2}".default or false); }
    ];
    quote = fold recursiveUpdate {} [
      { "${deps.syn."0.15.29".quote}"."proc-macro" =
        (f.quote."${deps.syn."0.15.29".quote}"."proc-macro" or false) ||
        (syn."0.15.29"."proc-macro" or false) ||
        (f."syn"."0.15.29"."proc-macro" or false); }
      { "${deps.syn."0.15.29".quote}".default = (f.quote."${deps.syn."0.15.29".quote}".default or false); }
    ];
    syn = fold recursiveUpdate {} [
      { "0.15.29".clone-impls =
        (f.syn."0.15.29".clone-impls or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".default = (f.syn."0.15.29".default or true); }
      { "0.15.29".derive =
        (f.syn."0.15.29".derive or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".parsing =
        (f.syn."0.15.29".parsing or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".printing =
        (f.syn."0.15.29".printing or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".proc-macro =
        (f.syn."0.15.29".proc-macro or false) ||
        (f.syn."0.15.29".default or false) ||
        (syn."0.15.29"."default" or false); }
      { "0.15.29".quote =
        (f.syn."0.15.29".quote or false) ||
        (f.syn."0.15.29".printing or false) ||
        (syn."0.15.29"."printing" or false); }
    ];
    unicode_xid."${deps.syn."0.15.29".unicode_xid}".default = true;
  }) [
    (features_.proc_macro2."${deps."syn"."0.15.29"."proc_macro2"}" deps)
    (features_.quote."${deps."syn"."0.15.29"."quote"}" deps)
    (features_.unicode_xid."${deps."syn"."0.15.29"."unicode_xid"}" deps)
  ];


# end
# termcolor-1.0.4

  crates.termcolor."1.0.4" = deps: { features?(features_.termcolor."1.0.4" deps {}) }: buildRustCrate {
    crateName = "termcolor";
    version = "1.0.4";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0xydrjc0bxg08llcbcmkka29szdrfklk4vh6l6mdd67ajifqw1mv";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."wincolor"."${deps."termcolor"."1.0.4"."wincolor"}" deps)
    ]) else []);
  };
  features_.termcolor."1.0.4" = deps: f: updateFeatures f (rec {
    termcolor."1.0.4".default = (f.termcolor."1.0.4".default or true);
    wincolor."${deps.termcolor."1.0.4".wincolor}".default = true;
  }) [
    (features_.wincolor."${deps."termcolor"."1.0.4"."wincolor"}" deps)
  ];


# end
# termion-1.5.1

  crates.termion."1.5.1" = deps: { features?(features_.termion."1.5.1" deps {}) }: buildRustCrate {
    crateName = "termion";
    version = "1.5.1";
    authors = [ "ticki <Ticki@users.noreply.github.com>" "gycos <alexandre.bury@gmail.com>" "IGI-111 <igi-111@protonmail.com>" ];
    sha256 = "02gq4vd8iws1f3gjrgrgpajsk2bk43nds5acbbb4s8dvrdvr8nf1";
    dependencies = (if !(kernel == "redox") then mapFeatures features ([
      (crates."libc"."${deps."termion"."1.5.1"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "redox" then mapFeatures features ([
      (crates."redox_syscall"."${deps."termion"."1.5.1"."redox_syscall"}" deps)
      (crates."redox_termios"."${deps."termion"."1.5.1"."redox_termios"}" deps)
    ]) else []);
  };
  features_.termion."1.5.1" = deps: f: updateFeatures f (rec {
    libc."${deps.termion."1.5.1".libc}".default = true;
    redox_syscall."${deps.termion."1.5.1".redox_syscall}".default = true;
    redox_termios."${deps.termion."1.5.1".redox_termios}".default = true;
    termion."1.5.1".default = (f.termion."1.5.1".default or true);
  }) [
    (features_.libc."${deps."termion"."1.5.1"."libc"}" deps)
    (features_.redox_syscall."${deps."termion"."1.5.1"."redox_syscall"}" deps)
    (features_.redox_termios."${deps."termion"."1.5.1"."redox_termios"}" deps)
  ];


# end
# textwrap-0.10.0

  crates.textwrap."0.10.0" = deps: { features?(features_.textwrap."0.10.0" deps {}) }: buildRustCrate {
    crateName = "textwrap";
    version = "0.10.0";
    authors = [ "Martin Geisler <martin@geisler.net>" ];
    sha256 = "1s8d5cna12smhgj0x2y1xphklyk2an1yzbadnj89p1vy5vnjpsas";
    dependencies = mapFeatures features ([
      (crates."unicode_width"."${deps."textwrap"."0.10.0"."unicode_width"}" deps)
    ]);
  };
  features_.textwrap."0.10.0" = deps: f: updateFeatures f (rec {
    textwrap."0.10.0".default = (f.textwrap."0.10.0".default or true);
    unicode_width."${deps.textwrap."0.10.0".unicode_width}".default = true;
  }) [
    (features_.unicode_width."${deps."textwrap"."0.10.0"."unicode_width"}" deps)
  ];


# end
# thread_local-0.3.6

  crates.thread_local."0.3.6" = deps: { features?(features_.thread_local."0.3.6" deps {}) }: buildRustCrate {
    crateName = "thread_local";
    version = "0.3.6";
    authors = [ "Amanieu d'Antras <amanieu@gmail.com>" ];
    sha256 = "02rksdwjmz2pw9bmgbb4c0bgkbq5z6nvg510sq1s6y2j1gam0c7i";
    dependencies = mapFeatures features ([
      (crates."lazy_static"."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
    ]);
  };
  features_.thread_local."0.3.6" = deps: f: updateFeatures f (rec {
    lazy_static."${deps.thread_local."0.3.6".lazy_static}".default = true;
    thread_local."0.3.6".default = (f.thread_local."0.3.6".default or true);
  }) [
    (features_.lazy_static."${deps."thread_local"."0.3.6"."lazy_static"}" deps)
  ];


# end
# toml-0.5.0

  crates.toml."0.5.0" = deps: { features?(features_.toml."0.5.0" deps {}) }: buildRustCrate {
    crateName = "toml";
    version = "0.5.0";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0l2lqzbn5g9l376k01isq1nhb14inkr4c50qbjbdzh5qysz7dyk5";
    dependencies = mapFeatures features ([
      (crates."serde"."${deps."toml"."0.5.0"."serde"}" deps)
    ]);
    features = mkFeatures (features."toml"."0.5.0" or {});
  };
  features_.toml."0.5.0" = deps: f: updateFeatures f (rec {
    serde."${deps.toml."0.5.0".serde}".default = true;
    toml = fold recursiveUpdate {} [
      { "0.5.0".default = (f.toml."0.5.0".default or true); }
      { "0.5.0".linked-hash-map =
        (f.toml."0.5.0".linked-hash-map or false) ||
        (f.toml."0.5.0".preserve_order or false) ||
        (toml."0.5.0"."preserve_order" or false); }
    ];
  }) [
    (features_.serde."${deps."toml"."0.5.0"."serde"}" deps)
  ];


# end
# twox-hash-1.1.2

  crates.twox_hash."1.1.2" = deps: { features?(features_.twox_hash."1.1.2" deps {}) }: buildRustCrate {
    crateName = "twox-hash";
    version = "1.1.2";
    authors = [ "Jake Goulding <jake.goulding@gmail.com>" ];
    sha256 = "1qzsazrdfla7qk0xi0c74f6hwf52z1sb9q07gjya06n6m5gwkvc5";
    dependencies = mapFeatures features ([
      (crates."rand"."${deps."twox_hash"."1.1.2"."rand"}" deps)
    ]);
  };
  features_.twox_hash."1.1.2" = deps: f: updateFeatures f (rec {
    rand."${deps.twox_hash."1.1.2".rand}".default = true;
    twox_hash."1.1.2".default = (f.twox_hash."1.1.2".default or true);
  }) [
    (features_.rand."${deps."twox_hash"."1.1.2"."rand"}" deps)
  ];


# end
# ucd-util-0.1.3

  crates.ucd_util."0.1.3" = deps: { features?(features_.ucd_util."0.1.3" deps {}) }: buildRustCrate {
    crateName = "ucd-util";
    version = "0.1.3";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1n1qi3jywq5syq90z9qd8qzbn58pcjgv1sx4sdmipm4jf9zanz15";
  };
  features_.ucd_util."0.1.3" = deps: f: updateFeatures f (rec {
    ucd_util."0.1.3".default = (f.ucd_util."0.1.3".default or true);
  }) [];


# end
# unicode-segmentation-1.2.1

  crates.unicode_segmentation."1.2.1" = deps: { features?(features_.unicode_segmentation."1.2.1" deps {}) }: buildRustCrate {
    crateName = "unicode-segmentation";
    version = "1.2.1";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0pzydlrq019cdiqbbfq205cskxcspwi97zfdi02rma21br1kc59m";
    features = mkFeatures (features."unicode_segmentation"."1.2.1" or {});
  };
  features_.unicode_segmentation."1.2.1" = deps: f: updateFeatures f (rec {
    unicode_segmentation."1.2.1".default = (f.unicode_segmentation."1.2.1".default or true);
  }) [];


# end
# unicode-width-0.1.5

  crates.unicode_width."0.1.5" = deps: { features?(features_.unicode_width."0.1.5" deps {}) }: buildRustCrate {
    crateName = "unicode-width";
    version = "0.1.5";
    authors = [ "kwantam <kwantam@gmail.com>" ];
    sha256 = "0886lc2aymwgy0lhavwn6s48ik3c61ykzzd3za6prgnw51j7bi4w";
    features = mkFeatures (features."unicode_width"."0.1.5" or {});
  };
  features_.unicode_width."0.1.5" = deps: f: updateFeatures f (rec {
    unicode_width."0.1.5".default = (f.unicode_width."0.1.5".default or true);
  }) [];


# end
# unicode-xid-0.1.0

  crates.unicode_xid."0.1.0" = deps: { features?(features_.unicode_xid."0.1.0" deps {}) }: buildRustCrate {
    crateName = "unicode-xid";
    version = "0.1.0";
    authors = [ "erick.tryzelaar <erick.tryzelaar@gmail.com>" "kwantam <kwantam@gmail.com>" ];
    sha256 = "05wdmwlfzxhq3nhsxn6wx4q8dhxzzfb9szsz6wiw092m1rjj01zj";
    features = mkFeatures (features."unicode_xid"."0.1.0" or {});
  };
  features_.unicode_xid."0.1.0" = deps: f: updateFeatures f (rec {
    unicode_xid."0.1.0".default = (f.unicode_xid."0.1.0".default or true);
  }) [];


# end
# utf8-ranges-1.0.2

  crates.utf8_ranges."1.0.2" = deps: { features?(features_.utf8_ranges."1.0.2" deps {}) }: buildRustCrate {
    crateName = "utf8-ranges";
    version = "1.0.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "1my02laqsgnd8ib4dvjgd4rilprqjad6pb9jj9vi67csi5qs2281";
  };
  features_.utf8_ranges."1.0.2" = deps: f: updateFeatures f (rec {
    utf8_ranges."1.0.2".default = (f.utf8_ranges."1.0.2".default or true);
  }) [];


# end
# vec_map-0.8.1

  crates.vec_map."0.8.1" = deps: { features?(features_.vec_map."0.8.1" deps {}) }: buildRustCrate {
    crateName = "vec_map";
    version = "0.8.1";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "Jorge Aparicio <japaricious@gmail.com>" "Alexis Beingessner <a.beingessner@gmail.com>" "Brian Anderson <>" "tbu- <>" "Manish Goregaokar <>" "Aaron Turon <aturon@mozilla.com>" "Adolfo Ochagavía <>" "Niko Matsakis <>" "Steven Fackler <>" "Chase Southwood <csouth3@illinois.edu>" "Eduard Burtescu <>" "Florian Wilkens <>" "Félix Raimundo <>" "Tibor Benke <>" "Markus Siemens <markus@m-siemens.de>" "Josh Branchaud <jbranchaud@gmail.com>" "Huon Wilson <dbau.pp@gmail.com>" "Corey Farwell <coref@rwell.org>" "Aaron Liblong <>" "Nick Cameron <nrc@ncameron.org>" "Patrick Walton <pcwalton@mimiga.net>" "Felix S Klock II <>" "Andrew Paseltiner <apaseltiner@gmail.com>" "Sean McArthur <sean.monstar@gmail.com>" "Vadim Petrochenkov <>" ];
    sha256 = "1jj2nrg8h3l53d43rwkpkikq5a5x15ms4rf1rw92hp5lrqhi8mpi";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."vec_map"."0.8.1" or {});
  };
  features_.vec_map."0.8.1" = deps: f: updateFeatures f (rec {
    vec_map = fold recursiveUpdate {} [
      { "0.8.1".default = (f.vec_map."0.8.1".default or true); }
      { "0.8.1".serde =
        (f.vec_map."0.8.1".serde or false) ||
        (f.vec_map."0.8.1".eders or false) ||
        (vec_map."0.8.1"."eders" or false); }
    ];
  }) [];


# end
# version_check-0.1.5

  crates.version_check."0.1.5" = deps: { features?(features_.version_check."0.1.5" deps {}) }: buildRustCrate {
    crateName = "version_check";
    version = "0.1.5";
    authors = [ "Sergio Benitez <sb@sergio.bz>" ];
    sha256 = "1yrx9xblmwbafw2firxyqbj8f771kkzfd24n3q7xgwiqyhi0y8qd";
  };
  features_.version_check."0.1.5" = deps: f: updateFeatures f (rec {
    version_check."0.1.5".default = (f.version_check."0.1.5".default or true);
  }) [];


# end
# void-1.0.2

  crates.void."1.0.2" = deps: { features?(features_.void."1.0.2" deps {}) }: buildRustCrate {
    crateName = "void";
    version = "1.0.2";
    authors = [ "Jonathan Reem <jonathan.reem@gmail.com>" ];
    sha256 = "0h1dm0dx8dhf56a83k68mijyxigqhizpskwxfdrs1drwv2cdclv3";
    features = mkFeatures (features."void"."1.0.2" or {});
  };
  features_.void."1.0.2" = deps: f: updateFeatures f (rec {
    void = fold recursiveUpdate {} [
      { "1.0.2".default = (f.void."1.0.2".default or true); }
      { "1.0.2".std =
        (f.void."1.0.2".std or false) ||
        (f.void."1.0.2".default or false) ||
        (void."1.0.2"."default" or false); }
    ];
  }) [];


# end
# whatlang-0.7.0

  crates.whatlang."0.7.0" = deps: { features?(features_.whatlang."0.7.0" deps {}) }: buildRustCrate {
    crateName = "whatlang";
    version = "0.7.0";
    authors = [ "Sergey Potapov <blake131313@gmail.com>" ];
    edition = "2018";
    sha256 = "0mxbh2rwqhrlz62ycy4sgaqh9ylqmx9zkc04lwzynylj1hmvn1rh";
    dependencies = mapFeatures features ([
      (crates."hashbrown"."${deps."whatlang"."0.7.0"."hashbrown"}" deps)
    ]);
  };
  features_.whatlang."0.7.0" = deps: f: updateFeatures f (rec {
    hashbrown."${deps.whatlang."0.7.0".hashbrown}".default = true;
    whatlang."0.7.0".default = (f.whatlang."0.7.0".default or true);
  }) [
    (features_.hashbrown."${deps."whatlang"."0.7.0"."hashbrown"}" deps)
  ];


# end
# which-2.0.1

  crates.which."2.0.1" = deps: { features?(features_.which."2.0.1" deps {}) }: buildRustCrate {
    crateName = "which";
    version = "2.0.1";
    authors = [ "Harry Fei <tiziyuanfang@gmail.com>" ];
    sha256 = "0lj0v21zriscaq5p7rb1r0j34z5yspjvwnldklbr45pxdp9zbgh7";
    dependencies = mapFeatures features ([
      (crates."failure"."${deps."which"."2.0.1"."failure"}" deps)
      (crates."libc"."${deps."which"."2.0.1"."libc"}" deps)
    ]);
  };
  features_.which."2.0.1" = deps: f: updateFeatures f (rec {
    failure = fold recursiveUpdate {} [
      { "${deps.which."2.0.1".failure}"."std" = true; }
      { "${deps.which."2.0.1".failure}".default = (f.failure."${deps.which."2.0.1".failure}".default or false); }
    ];
    libc."${deps.which."2.0.1".libc}".default = true;
    which."2.0.1".default = (f.which."2.0.1".default or true);
  }) [
    (features_.failure."${deps."which"."2.0.1"."failure"}" deps)
    (features_.libc."${deps."which"."2.0.1"."libc"}" deps)
  ];


# end
# winapi-0.2.8

  crates.winapi."0.2.8" = deps: { features?(features_.winapi."0.2.8" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.2.8";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
  };
  features_.winapi."0.2.8" = deps: f: updateFeatures f (rec {
    winapi."0.2.8".default = (f.winapi."0.2.8".default or true);
  }) [];


# end
# winapi-0.3.6

  crates.winapi."0.3.6" = deps: { features?(features_.winapi."0.3.6" deps {}) }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.6";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1d9jfp4cjd82sr1q4dgdlrkvm33zhhav9d7ihr0nivqbncr059m4";
    build = "build.rs";
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_i686_pc_windows_gnu"."${deps."winapi"."0.3.6"."winapi_i686_pc_windows_gnu"}" deps)
    ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([
      (crates."winapi_x86_64_pc_windows_gnu"."${deps."winapi"."0.3.6"."winapi_x86_64_pc_windows_gnu"}" deps)
    ]) else []);
    features = mkFeatures (features."winapi"."0.3.6" or {});
  };
  features_.winapi."0.3.6" = deps: f: updateFeatures f (rec {
    winapi."0.3.6".default = (f.winapi."0.3.6".default or true);
    winapi_i686_pc_windows_gnu."${deps.winapi."0.3.6".winapi_i686_pc_windows_gnu}".default = true;
    winapi_x86_64_pc_windows_gnu."${deps.winapi."0.3.6".winapi_x86_64_pc_windows_gnu}".default = true;
  }) [
    (features_.winapi_i686_pc_windows_gnu."${deps."winapi"."0.3.6"."winapi_i686_pc_windows_gnu"}" deps)
    (features_.winapi_x86_64_pc_windows_gnu."${deps."winapi"."0.3.6"."winapi_x86_64_pc_windows_gnu"}" deps)
  ];


# end
# winapi-build-0.1.1

  crates.winapi_build."0.1.1" = deps: { features?(features_.winapi_build."0.1.1" deps {}) }: buildRustCrate {
    crateName = "winapi-build";
    version = "0.1.1";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
    libName = "build";
  };
  features_.winapi_build."0.1.1" = deps: f: updateFeatures f (rec {
    winapi_build."0.1.1".default = (f.winapi_build."0.1.1".default or true);
  }) [];


# end
# winapi-i686-pc-windows-gnu-0.4.0

  crates.winapi_i686_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_i686_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
  };
  features_.winapi_i686_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu."0.4.0".default = (f.winapi_i686_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# winapi-util-0.1.2

  crates.winapi_util."0.1.2" = deps: { features?(features_.winapi_util."0.1.2" deps {}) }: buildRustCrate {
    crateName = "winapi-util";
    version = "0.1.2";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "07jj7rg7nndd7bqhjin1xphbv8kb5clvhzpqpxkvm3wl84r3mj1h";
    dependencies = (if kernel == "windows" then mapFeatures features ([
      (crates."winapi"."${deps."winapi_util"."0.1.2"."winapi"}" deps)
    ]) else []);
  };
  features_.winapi_util."0.1.2" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.winapi_util."0.1.2".winapi}"."consoleapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."errhandlingapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."fileapi" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."minwindef" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."processenv" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."std" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winbase" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."wincon" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winerror" = true; }
      { "${deps.winapi_util."0.1.2".winapi}"."winnt" = true; }
      { "${deps.winapi_util."0.1.2".winapi}".default = true; }
    ];
    winapi_util."0.1.2".default = (f.winapi_util."0.1.2".default or true);
  }) [
    (features_.winapi."${deps."winapi_util"."0.1.2"."winapi"}" deps)
  ];


# end
# winapi-x86_64-pc-windows-gnu-0.4.0

  crates.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: { features?(features_.winapi_x86_64_pc_windows_gnu."0.4.0" deps {}) }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
  };
  features_.winapi_x86_64_pc_windows_gnu."0.4.0" = deps: f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu."0.4.0".default = (f.winapi_x86_64_pc_windows_gnu."0.4.0".default or true);
  }) [];


# end
# wincolor-1.0.1

  crates.wincolor."1.0.1" = deps: { features?(features_.wincolor."1.0.1" deps {}) }: buildRustCrate {
    crateName = "wincolor";
    version = "1.0.1";
    authors = [ "Andrew Gallant <jamslam@gmail.com>" ];
    sha256 = "0gr7v4krmjba7yq16071rfacz42qbapas7mxk5nphjwb042a8gvz";
    dependencies = mapFeatures features ([
      (crates."winapi"."${deps."wincolor"."1.0.1"."winapi"}" deps)
      (crates."winapi_util"."${deps."wincolor"."1.0.1"."winapi_util"}" deps)
    ]);
  };
  features_.wincolor."1.0.1" = deps: f: updateFeatures f (rec {
    winapi = fold recursiveUpdate {} [
      { "${deps.wincolor."1.0.1".winapi}"."minwindef" = true; }
      { "${deps.wincolor."1.0.1".winapi}"."wincon" = true; }
      { "${deps.wincolor."1.0.1".winapi}".default = true; }
    ];
    winapi_util."${deps.wincolor."1.0.1".winapi_util}".default = true;
    wincolor."1.0.1".default = (f.wincolor."1.0.1".default or true);
  }) [
    (features_.winapi."${deps."wincolor"."1.0.1"."winapi"}" deps)
    (features_.winapi_util."${deps."wincolor"."1.0.1"."winapi_util"}" deps)
  ];


# end
}
