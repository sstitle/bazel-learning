"""Module extension to fetch SI library source"""

def _fetch_repo_impl(repository_ctx):
    """Download and extract the SI library source"""
    repository_ctx.download_and_extract(
        url = repository_ctx.attr.urls,
        sha256 = repository_ctx.attr.sha256 if repository_ctx.attr.sha256 else "",
        stripPrefix = repository_ctx.attr.strip_prefix if repository_ctx.attr.strip_prefix else "",
    )
    
    # Create BUILD file
    build_content = '''filegroup(
    name = "all",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)'''
    repository_ctx.file("BUILD", build_content)

_fetch_repo = repository_rule(
    implementation = _fetch_repo_impl,
    attrs = {
        "urls": attr.string_list(mandatory = True),
        "strip_prefix": attr.string(default = ""),
        "sha256": attr.string(default = ""),
    },
)

fetch = tag_class(
    attrs = {
        "name": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "strip_prefix": attr.string(default = ""),
        "sha256": attr.string(default = ""),
    },
)

def _si_ext_impl(module_ctx):
    """Module extension implementation"""
    for mod in module_ctx.modules:
        for t in mod.tags.fetch:
            _fetch_repo(
                name = t.name,
                urls = t.urls,
                strip_prefix = t.strip_prefix,
                sha256 = t.sha256,
            )

si_ext = module_extension(
    implementation = _si_ext_impl,
    tag_classes = {"fetch": fetch},
)
