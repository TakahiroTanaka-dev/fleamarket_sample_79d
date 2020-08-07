$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file" name="item[images_attributes][${num}][image]" id="item_images_attributes_${num}_item"><br>
                    <input data-index="${num}" class="hidden-destroy" type="checkbox" value="${num}" name="item[images_attributes][${num}][_destroy]" id="item_images_attributes_${num}__destroy">
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `
    <div class="js-file_group" data-index="${index}">
      <img src="${url}" data-index="${index}" width="100px" height="100px" class="js-file">
    <div class="js-remove">削除</div>
    <span class="js-edit">編集</span>
    </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  
  // input:last.trigger("click")
  $('#image-box').on('click', function(){
    $('.js-file:last').trigger('click')
  })

  $('#previews').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('.js-box').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#previews').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });
  $(document).on('click', '.js-remove', function(){
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    $(`#item_images_attributes_${targetIndex}_image`).remove()
  })
  
});

// edit側の処理を分離させました。
$(function(){
  $(document).on('click', '.js-edit' ,function(){
    const editIndex = $(this).parent().data('index')
    $(`#item_images_attributes_${editIndex}_image`).click()
    $(`#item_images_attributes_${editIndex}_image`).off('click')
    $(`#item_images_attributes_${editIndex}_item`).click()
    $(`#item_images_attributes_${editIndex}_item`).off('click')
  })
})


// ここからはカテゴリーの子要素と孫要素を追加するよ！！
// 多分ターボリンクにしないとうまくページが読み込めないっぽい
$(document).on('turbolinks:load', ()=> {

  function appendOption(category) {
    const html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML){
    let childSelectHTML = '';
    childSelectHTML = `
      <select class="select--wrap-cat1__default-category1" id="child_form" name="category_id" style="margin-top: 10px">
        <option value="---" data-category="---">選択してください</option>
        ${insertHTML}
      </select>
    
    `
    $('.product-main__contents__detailsection__select').append(childSelectHTML);
  }

  function appendGrandchildrenBox(insertHTML) {
    let grandchildSelectHtml = '';
    grandchildSelectHtml = `
    <select class="select--wrap-cat1__default-category1" id="grandchild_form" name="category_id" style="margin-top: 10px">
      <option value="---" data-category="---">---</option>
        ${insertHTML}
    </select>`; 
  
  
    $('.product-main__contents__detailsection__select').append(grandchildSelectHtml);
  }

  $('#parent-form').on('change', function(){
    const parentValue = document.getElementById("parent-form").value;
    if (parentValue != ""){
      $.ajax({
        url: '/items/get_category_children',
        type: "GET",
        data: {
          parent_id: parentValue
        },
        dataType: 'json'
      })

      .done(function(children){
        $('#child_form').remove();
        $('#grandchild_form').remove();
        let insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })

      .fail(function(){
        alert('カテゴリを入力してください')
      })
    }
    else {
      $('#child_form').remove();
      $('#grandchild_form').remove();
    }
  })
  // 孫要素のアクション
  $(".product-main__contents__detailsection__select").on("change", "#child_form", function() {
    var childValue = $('#child_form option:selected').data('category');
    if (childValue != "") {
      $('#grandchild_form').remove();
      $.ajax({
        url     : '/items/get_category_grandchildren',
        type    : 'GET',
        data    : {
          child_id: childValue
        },
        dataType: 'json'
      })

      .done(function(grandchildren) {
        let insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function() {
        alert('カテゴリーを入力して下さい');
      })
    } else {
      $('#grandchild_form').remove();
    }
  });
});