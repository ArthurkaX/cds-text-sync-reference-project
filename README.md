# CODESYS Compatibility Examples

This repository is designed to collect examples of CODESYS blocks and objects that **cannot be exported or imported** correctly using `cds-text-sync` (v2.0.1+, XML-First) or standard CODESYS mechanisms.

It serves as a companion to the main **[cds-text-sync](https://github.com/ArthurkaX/cds-text-sync)** tool — hosting test cases, edge cases, and problematic objects for debugging automation workflows and understanding the limitations of the CODESYS scripting API.

## 🎯 Purpose

The main goal is to build a database of "problematic" objects that fail round-trip verification. If an object cannot be:

- **Exported** to the editable view (`project-view/`),
- **Deleted** from the IDE,
- **Imported** back from disk files,
- and **Compared** (IDE vs original) with zero differences,

…it belongs here.

## 🔍 External Diffing

If you need to analyze changes in complex XML objects (Visualizations, Alarms, etc.) that are hard to read in the built-in diff viewer:

1. **Press CTRL + Click "Diff"** in the `Project_compare_ui.py` comparison dialog.
2. This saves both the IDE and Disk versions to the **`.diff/`** folder.
3. Use an external tool (VS Code, WinMerge, etc.) for a more detailed comparison.

## 🚀 How to Contribute

We welcome any examples of blocks that refuse to be automated. To add your example:

1. **Open an Issue**: Use the full path and type in the title, e.g., `Application/folder/Dynamic - failed to import/export` or `with errors`.
2. **Provide a Project Link**: Include a **public link to the .project file** with the example in your Issue.

Please submit updates as public links to `.project` files when opening an issue.

_I will update this project as much as possible, but I really appreciate everyone's contributions. The CODESYS environment has a vast set of tools, and it is physically impossible for me to know or use them all._

_Current Environment: I am using **CODESYS V3.5 SP20 Patch 1 + (32-bit)**. Please provide projects adapted for this version if possible. In any case, we can find a way to exchange code via [Discussions](https://github.com/ArthurkaX/cds-text-sync/discussions)._

## ✅ Verification Procedure (cds-text-sync v2.0.1+)

To ensure an object is suitable for this collection, follow these steps using the XML-First workflow:

1. **Create** the object in CODESYS.
2. **Run `Project_export.py`** — captures the IDE snapshot to `.dump/IDE.xml` and builds the editable view in `project-view/`.
3. **Create a Backup** (Copy) of the reference project state (or use the `.backup/` safety backup feature in `Project_options.py`).
4. **Delete** the object from the CODESYS project.
5. **Run `Project_import.py`** — the external engine compares disk files against the fresh snapshot and applies changes back into the IDE.
6. **Compare** the imported object against the original (reference backup):
   - Use **`Project_compare_ui.py`** for an interactive dialog with per-object diff viewing.
   - Use **`Project_compare.py`** for a machine-readable report (`.dump/compare_report.json`).
   - For deep analysis, use the **External Diff** feature (`CTRL + Diff` in `compare_ui`) to save files to `.diff/` and compare them in an external editor.

If any of these steps fail or produce differences, the object is a candidate for this repository.

> [!NOTE]
> This procedure assumes the default `project-view/` layout and XML-First engine from `cds-text-sync` v2.0.1+. Older ST-oriented workflows are preserved under `old_scripts/` in the main repository but are not the primary target for this reference project.
