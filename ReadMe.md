# CODESYS Compatibility Examples

This repository is designed to collect examples of CODESYS blocks and objects that **cannot be exported or imported** correctly using standard mechanisms or tools like `cds-text-sync`.

## 🎯 Purpose

The main goal is to build a database of "problematic" objects to help debug automation tools and understand the limitations of the CODESYS API. If an object cannot be saved as text or restored from it, it belongs here.

## 🚀 How to Contribute

We welcome any examples of blocks that refuse to be automated. To add your example:

1. **Open an Issue**: Use the full path and type in the title, e.g., `Application/folder/Dynamic - failed to import/export` or `with errors`.
2. **Provide a Project Link**: Include a **public link to the .project file** with the example in your Issue.

Please submit updates as public links to `.project` files when opening an issue.

_I will update this project as much as possible, but I really appreciate everyone's contributions. The CODESYS environment has a vast set of tools, and it is physically impossible for me to know or use them all._

## ✅ Verification Procedure

To ensure an object is suitable for this collection, follow these steps:

1. **Create** the object in CODESYS.
2. **Create a Backup** (Copy) of the reference project state.
3. **Export** it using the sync tool.
4. **Delete** the object from the CODESYS project.
5. **Import** it back from the exported files.
6. **Compare**: The imported object must match the original (reference backup) exactly. There should be no differences.

If any of these steps fail or produce differences, the object is a candidate for this repository.
