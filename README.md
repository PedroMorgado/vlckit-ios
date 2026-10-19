# VLCKit-iOS

This repository provides a **Swift Package Manager (SPM)** compatible wrapper for the [VLCKit framework](https://code.videolan.org/videolan/VLCKit) for iOS, tvOS, and macOS.

This package redistributes precompiled VideoLAN frameworks in a combined XCFramework without changing their source code.

The current VLCKit version packaged in this repository is **3.7.3**.

VideoLAN now provides an [official Swift package](https://github.com/videolan/vlckit/blob/master/Package.swift) on its 4.x development line. As checked on October 19, 2026, that manifest points to an unstable 4.0 binary. The upstream [3.7.4 tag](https://github.com/videolan/vlckit/tree/3.7.4) exists but does not contain a `Package.swift`, so it cannot be selected directly as a Swift package version from the official repository. This wrapper requires a new release to package a newer upstream version.

---

## 📦 Installation

To use this package in your iOS project, add it through **Swift Package Manager**:

1. In Xcode, go to **File > Add Packages...**
2. Enter the repository URL:
   ```
   https://github.com/PedroMorgado/vlckit-ios.git
   ```
3. Choose the latest release and add it to your target.

---

## ⚙️ How It Works

When you add this package, SwiftPM downloads the `.zip` file containing `VLCKit.xcframework` from the release corresponding to the selected version tag.  
Once unzipped, it makes the framework available for import in your Swift project:

```swift
import VLCKit
```

---

## 🔄 Updating the VLCKit Framework

1. Check if there is a new stable version of VLCKit available at:
   https://download.videolan.org/pub/cocoapods/prod/

2. Update the URLs inside the `Scripts/generate-vlc-kit.sh` script for iOS, macOS, and tvOS to match the VLCKit version you want to download.

3. Open a terminal and navigate to the `Scripts` folder within this repository.

4. Run the script:
   ```bash
   ./generate-vlc-kit.sh
   ```
5. The script will:
   - Download the **VLCKit** frameworks for iOS, macOS, and tvOS from the URLs configured in the script.
   - Merge them into a single `.xcframework`.
   - Create a zipped file and display its SHA256 checksum in the terminal.
   - Generate a temporary folder `tmp` inside the `Scripts` directory containing the generated files.

6. Open `Package.swift` and update:
   - The **URL** to point to the new release (only update the version number in the URL).
   - The **checksum** (binary hash) value with the new hash printed by the script.

7. Commit and push your changes in `Package.swift` and `Scripts/generate-vlc-kit.sh`.

8. Create a new **tag** matching the version of the updated VLCKit.

9. Go to GitHub → this repository → **Releases** → create a new release using the new tag, and upload the generated `.zip` file.

10. Once uploaded, you can now use the new version in your main project.

11. Finally, delete the temporary `tmp` folder inside the `Scripts` directory to clean up.

## 🧩 Notes

- This project **redistributes VLCKit binaries** through GitHub Releases. Repackaging unmodified frameworks does not remove the upstream license obligations.
- You must comply with the original [VideoLAN licensing terms](https://www.videolan.org/legal.html).
- Updates are manual. A new upstream tag does not automatically become available through this package.

---

## 🪪 License

This repository does not contain or modify the source code of VLCKit.  
It combines the official precompiled frameworks into a `VLCKit.xcframework` for Swift Package Manager integration.

VLCKit is licensed under **LGPLv2.1 or later**. Included third-party components may have additional license and notice requirements.

LGPL permits proprietary and commercial applications when its conditions are met. Distributors must preserve the applicable notices and license texts, provide the corresponding library sources and modifications through a compliant distribution method, and satisfy the applicable modification and relinking requirements. The required materials depend on the actual linkage and bundled components; using SPM or an XCFramework does not establish compliance by itself.

The current packaging script does not explicitly copy the upstream package's external `COPYING.txt` or corresponding sources into the generated ZIP. Audit the published artifact and arrange the required materials before distributing an application or an updated binary release. This README is not a completed compliance audit.

- VLCKit source code and release tags: https://github.com/videolan/vlckit  
- License text (LGPL 2.1): https://opensource.org/license/LGPL-2.1/  
- VideoLAN legal page: https://www.videolan.org/legal.html
