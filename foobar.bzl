# Just defines a rule that cats a bunch of files together.

def _dummy_verilog_rule_impl(ctx):
    out_file = ctx.actions.declare_file(ctx.label.name + ".cat.v")
    all_srcs_str = " ".join([f.path for f in ctx.files.srcs])
    ctx.actions.run_shell(
        mnemonic = "DummyVerilogRule" + ctx.label.name,
        outputs = [out_file],
        inputs = ctx.files.srcs,
        command = "cat %s > %s" % ((all_srcs_str, out_file.path)),
    )

    return [DefaultInfo(files=depset([out_file]))]

dummy_verilog_rule = rule(
    implementation = _dummy_verilog_rule_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".v", ".sv", ".vp", ".svp"]),
    },
)
