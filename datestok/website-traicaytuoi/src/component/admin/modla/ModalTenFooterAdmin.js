import React, { useEffect, useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';
import axios from 'axios';
import { toast } from 'react-toastify';

const ModalTenFooterAdmin = ({ show, handleClose, isEdit, tenFooter, fetchTenFooters }) => {
  const [tieude, setTieude] = useState('');
  const [phude, setPhude] = useState('');
  const [hinhanhs, setHinhanhs] = useState([]); // Hình ảnh mới thêm
  const [links, setLinks] = useState([]); // Link cho hình ảnh mới
  const [hienCo, setHienCo] = useState([]); // Hình ảnh và link hiện có từ API

  useEffect(() => {
    if (isEdit && tenFooter) {
      setTieude(tenFooter.tieude || '');
      setPhude(tenFooter.phude || '');

      // Lấy danh sách hình ảnh và link hiện có
      const existingImages = tenFooter.footerIMG?.map((img) => ({
        id: img.id,
        imagePath: img.imagePath,
        link: img.link,
      })) || [];
      setHienCo(existingImages);

      setHinhanhs([]); // Xóa danh sách hình ảnh mới
      setLinks([]); // Xóa danh sách link mới
    } else {
      setTieude('');
      setPhude('');
      setHienCo([]);
      setHinhanhs([]);
      setLinks([]);
    }
  }, [isEdit, tenFooter]);

  const handleAddFileInput = () => {
    setHinhanhs([...hinhanhs, null]);
    setLinks([...links, '']);
  };

  const handleFileChange = (index, file) => {
    const updatedHinhanhs = [...hinhanhs];
    updatedHinhanhs[index] = file;
    setHinhanhs(updatedHinhanhs);
  };

  const handleLinkChange = (index, link) => {
    const updatedLinks = [...links];
    updatedLinks[index] = link;
    setLinks(updatedLinks);
  };

  const handleRemoveExistingImage = async (imageId) => {
    try {
      await axios.delete(`${process.env.REACT_APP_BASEURL}/api/TenFooter/DeleteImage/${imageId}`);
      setHienCo(hienCo.filter((img) => img.id !== imageId)); // Xóa khỏi danh sách hiện có
      toast.success('Xóa hình ảnh thành công!');
    } catch (error) {
      console.error('Lỗi khi xóa hình ảnh:', error);
      toast.error('Không thể xóa hình ảnh!');
    }
  };

  const handleSave = async () => {
    const formData = new FormData();
    formData.append('tieude', tieude);
    formData.append('phude', phude);
  
    // Xử lý hình ảnh hiện có (thay đổi link hoặc cập nhật hình ảnh)
    hienCo.forEach((img) => {
      if (img.newFile) {
        // Nếu hình ảnh mới được chọn, gửi cả file và ID để thay đổi
        formData.append('existingImages', JSON.stringify({ id: img.id, link: img.link }));
        formData.append('newFiles', img.newFile);
      } else {
        // Chỉ cập nhật link nếu không có file mới
        formData.append('existingLinks', JSON.stringify({ id: img.id, link: img.link }));
      }
    });
  
    // Thêm hình ảnh mới
    hinhanhs.forEach((file, i) => {
      if (file) {
        formData.append('images', file);
        formData.append('links', links[i]);
      }
    });
  
    try {
      if (isEdit) {
        await axios.put(`${process.env.REACT_APP_BASEURL}/api/TenFooter/${tenFooter.id}`, formData);
        toast.success('Cập nhật TenFooter thành công!');
      } else {
        await axios.post(`${process.env.REACT_APP_BASEURL}/api/TenFooter`, formData);
        toast.success('Thêm TenFooter thành công!');
      }
      fetchTenFooters();
      handleClose();
      ResetForm();
    } catch (error) {
      console.error('Lỗi khi lưu TenFooter:', error);
      toast.error('Không thể lưu TenFooter!');
    }
  };
  
const ResetForm = () => {
  setTieude("");
  setPhude("");
  setLinks([]);
  setHienCo([]);
  setHinhanhs([]);

}


  return (
    <Modal show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title>{isEdit ? 'Chỉnh sửa TenFooter' : 'Thêm TenFooter mới'}</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form>
          <Form.Group>
            <Form.Label>Tiêu đề</Form.Label>
            <Form.Control
              type="text"
              value={tieude}
              onChange={(e) => setTieude(e.target.value)}
            />
          </Form.Group>
          <Form.Group>
            <Form.Label>Phụ đề</Form.Label>
            <Form.Control
              type="text"
              value={phude}
              onChange={(e) => setPhude(e.target.value)}
            />
          </Form.Group>
         <Form.Group>
  <Form.Label>Hình ảnh hiện có</Form.Label>
  {hienCo.map((img, index) => (
    <div key={img.id} className="d-flex align-items-center mb-2">
      {/* Hiển thị hình ảnh hiện tại */}
      <img
        src={`${process.env.REACT_APP_BASEURL}${img.imagePath}`}
        alt="Footer"
        style={{ width: '100px', height: '50px', objectFit: 'cover', marginRight: '10px', borderRadius: '4px' }}
      />
      {/* Input thay đổi link */}
      <Form.Control
        type="text"
        placeholder="Link mới"
        value={img.link}
        onChange={(e) => {
          const updatedHienCo = [...hienCo];
          updatedHienCo[index].link = e.target.value;
          setHienCo(updatedHienCo);
        }}
        className="me-2"
      />
      {/* Input thay đổi hình ảnh */}
      <Form.Control
        type="file"
          accept="image/*"
        onChange={(e) => {
          const updatedHienCo = [...hienCo];
          updatedHienCo[index].newFile = e.target.files[0]; // Lưu file mới vào danh sách hiện có
          setHienCo(updatedHienCo);
          
        }}
        className="me-2"
      />
      <Button variant="danger" onClick={() => handleRemoveExistingImage(img.id)}>Xóa</Button>
    </div>
  ))}
</Form.Group>

          <Form.Group>
            <Form.Label>Thêm hình ảnh mới</Form.Label>
            {hinhanhs.map((file, index) => (
              <div key={index} className="d-flex mb-2">
                <Form.Control
                  type="file"
                  onChange={(e) => handleFileChange(index, e.target.files[0])}
                    accept="image/*"
                />
                <Form.Control
                  type="text"
                  placeholder="Link hình ảnh"
                  value={links[index]}
                  onChange={(e) => handleLinkChange(index, e.target.value)}
                  className="ms-2"
                />
              </div>
            ))}
            <Button variant="secondary" onClick={handleAddFileInput}>Thêm ảnh</Button>
          </Form.Group>
        </Form>
      </Modal.Body>
      <Modal.Footer>
        <Button variant="secondary" onClick={handleClose}>Đóng</Button>
        <Button variant="primary" onClick={handleSave}>Lưu</Button>
      </Modal.Footer>
    </Modal>
  );
};

export default ModalTenFooterAdmin;
