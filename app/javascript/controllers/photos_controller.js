import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "video",
    "canvas",
    "photoPreview",
    "takePhoto",
    "confirmPhoto",
    "retakePhoto",
    "photoUpload"
  ];

  connect() {
    const constraints = {
      video: {
        facingMode: "environment",
        zoom: 1.5,
        focusMode: 'manual',
      }
    };
    navigator.mediaDevices.getUserMedia(constraints)
      .then((stream) => {
        this.videoTarget.srcObject = stream;
      })
      .catch((err) => {
        console.error("Erreur d'accès à la caméra :", err);
      });
  }

  takePhoto() {
    const context = this.canvasTarget.getContext("2d");
    this.canvasTarget.width = this.videoTarget.videoWidth;
    this.canvasTarget.height = this.videoTarget.videoHeight;

    // Capturer l'image sur le canvas
    context.drawImage(this.videoTarget, 0, 0, this.canvasTarget.width, this.canvasTarget.height);

    // Convertir le canvas en aperçu d'image
    const dataUrl = this.canvasTarget.toDataURL("image/png");
    this.photoPreviewTarget.src = dataUrl;
    this.photoPreviewTarget.style.display = "block";

    // Masquer la vidéo et ajuster les boutons
    this.videoTarget.style.display = "none";
    this.takePhotoTarget.style.display = "none";
    this.confirmPhotoTarget.style.display = "block";
    this.retakePhotoTarget.style.display = "block";
  }

  confirmPhoto() {
    this.canvasTarget.toBlob((blob) => {
      const photoName = `photo_${Date.now()}.png`;
      const file = new File([blob], photoName, { type: "image/png" });

      const dataTransfer = new DataTransfer();
      dataTransfer.items.add(file);

      this.photoUploadTarget.files = dataTransfer.files;
      console.log('upload: ', this.photoUploadTarget.files);

      this.confirmPhotoTarget.style.display = "none";
    });
  }


  retakePhoto() {
    // Réinitialiser l'affichage
    this.photoPreviewTarget.style.display = "none";
    this.videoTarget.style.display = "block";

    // Réafficher le bouton "Prendre la photo"
    this.takePhotoTarget.style.display = "block";
    this.confirmPhotoTarget.style.display = "none";
    this.retakePhotoTarget.style.display = "none";
  }
}
