load("//:foobar.bzl", "dummy_verilog_rule")

genrule(
    name = "a",
    outs = ["a.v"],
    cmd = "echo 'module a(); endmodule' > $@",
)

genrule(
    name = "b",
    outs = ["b.v"],
    cmd = "echo 'module b; endmodule' > $@",
)

dummy_verilog_rule(
    name = "foobar",
    srcs = ["a", "b"],
)
