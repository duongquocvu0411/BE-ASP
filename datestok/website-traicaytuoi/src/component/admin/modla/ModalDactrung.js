import React, { useEffect, useState } from "react";
import { Modal, Button, Form } from "react-bootstrap";
import axios from "axios";
import { toast } from "react-toastify";

const ModalDactrung = ({ show, handleClose, isEdit, dactrung, fetchDactrungs }) => {
  const [tieude, setTieude] = useState("");
  const [phude, setPhude] = useState("");
  const [thutuhienthi, setThutuhienthi] = useState("");
  const [iconFile, setIconFile] = useState(null); // Trường iconFile (file ảnh biểu tượng)
  const [iconPreview, setIconPreview] = useState(""); // Dùng để hiển thị ảnh đại diện (preview)

  // Gán dữ liệu khi mở modal (trường hợp chỉnh sửa)
  useEffect(() => {
    if (isEdit && dactrung) {
      setTieude(dactrung.tieude);
      setPhude(dactrung.phude);
      setThutuhienthi(dactrung.thutuhienthi);
      setIconPreview(`${process.env.REACT_APP_BASEURL}/${dactrung.icon}`);
      setIconFile(null); // Không thay đổi file icon nếu không cập nhật
    } else {
      // Reset dữ liệu khi mở modal thêm mới
      setTieude("");
      setPhude("");
      setThutuhienthi("");
      setIconPreview(""); // Không có ảnh trước khi chọn
      setIconFile(null);  // Không có file ảnh
    }
  }, [isEdit, dactrung]);

  // Xử lý khi người dùng chọn file ảnh mới
  const handleFileChange = (e) => {
    const file = e.target.files[0];
    setIconFile(file);

    // Hiển thị ảnh preview ngay khi chọn
    const reader = new FileReader();
    reader.onloadend = () => {
      setIconPreview(reader.result); // Gán dữ liệu base64 vào state để hiển thị
    };
    if (file) {
      reader.readAsDataURL(file); // Đọc file và tạo dữ liệu base64
    }
  };

  // Xử lý gửi dữ liệu
  const handleSubmit = async () => {
    const formData = new FormData();
    formData.append("tieude", tieude);
    formData.append("phude", phude);
    formData.append("thutuhienthi", thutuhienthi);
    if (iconFile) {
      formData.append("iconFile", iconFile); // File ảnh biểu tượng
    }

    try {
      const token = localStorage.getItem("adminToken");

      if (isEdit) {
        // PUT: Cập nhật đặc trưng
        await axios.put(
          `${process.env.REACT_APP_BASEURL}/api/dactrung/${dactrung.id}`,
          formData,
          {
            headers: {
              "Content-Type": "multipart/form-data",
              Authorization: `Bearer ${token}`,
            },
          }
        );
        toast.success("Đã cập nhật đặc trưng thành công!", {
          position: "top-right",
          autoClose: 3000,
        });
      } else {
        // POST: Thêm mới đặc trưng
        await axios.post(`${process.env.REACT_APP_BASEURL}/api/dactrung`, formData, {
          headers: {
            "Content-Type": "multipart/form-data",
            Authorization: `Bearer ${token}`,
          },
        });
        toast.success("Đã thêm đặc trưng thành công!", {
          position: "top-right",
          autoClose: 3000,
        });
      }

      fetchDactrungs(); // Làm mới danh sách đặc trưng
      handleClose(); // Đóng modal
      resetForm();
    } catch (error) {
      console.error("Có lỗi xảy ra:", error);
      toast.error("Có lỗi xảy ra khi xử lý đặc trưng!", {
        position: "top-right",
        autoClose: 3000,
      });
    }
  };

  // Reset form khi đóng modal
  const resetForm = () => {
    setTieude("");
    setPhude("");
    setThutuhienthi("");
    setIconPreview(""); // Xóa ảnh preview
    setIconFile(null);  // Xóa file ảnh
  };

  return (
    <Modal show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>{isEdit ? "Chỉnh sửa đặc trưng" : "Thêm mới đặc trưng"}</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          {/* Tiêu đề */}
          <Form.Group className="mb-3">
            <Form.Label>Tiêu đề</Form.Label>
            <Form.Control
              type="text"
              value={tieude}
              onChange={(e) => setTieude(e.target.value)}
              placeholder="Nhập tiêu đề"
            />
          </Form.Group>

          {/* Phụ đề */}
          <Form.Group className="mb-3">
            <Form.Label>Phụ đề</Form.Label>
            <Form.Control
              type="text"
              value={phude}
              onChange={(e) => setPhude(e.target.value)}
              placeholder="Nhập phụ đề"
            />
          </Form.Group>

          {/* Thứ tự hiển thị */}
          <Form.Group className="mb-3">
            <Form.Label>Thứ tự hiển thị</Form.Label>
            <Form.Control
              type="number"
              value={thutuhienthi}
              onChange={(e) => setThutuhienthi(e.target.value)}
              placeholder="Nhập thứ tự hiển thị"
            />
          </Form.Group>

          {/* Hiển thị ảnh cũ nếu là chế độ chỉnh sửa, hoặc preview ảnh mới nếu có */}
          {iconPreview && (
            <div className="mb-3">
              <img
                src={iconPreview}
                alt="Icon Preview"
                style={{ width: "100px", height: "100px", objectFit: "cover" }}
              />
            </div>
          )}

          {/* Icon File (ảnh biểu tượng) */}
          <Form.Group className="mb-3">
            <Form.Label>Icon File</Form.Label>
            <Form.Control
              type="file"
              onChange={handleFileChange}
              accept="image/*"
            />
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={handleClose}>
          Hủy
        </Button>
        <Button variant="primary" onClick={handleSubmit}>
          {isEdit ? "Cập nhật" : "Thêm mới"}
        </Button>
      </Modal.Footer>
    </Modal>
  );
};

export default ModalDactrung;
