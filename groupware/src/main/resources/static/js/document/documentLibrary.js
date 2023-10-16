function convertFileSize(fileSizeInBytes) {
	if (fileSizeInBytes < 1024) {
		return fileSizeInBytes + ' B';
	} else if (fileSizeInBytes < 1024 * 1024) {
		return (fileSizeInBytes / 1024).toFixed(2) + ' KB';
	} else {
		return (fileSizeInBytes / (1024 * 1024)).toFixed(2) + ' MB';
	}
}
$(document)
	.ready(
		function() {
			$('td[data-filesize]')
				.each(
					function() {
						var fileSizeInBytes = parseInt($(
							this).attr('data-filesize'));
						var convertedSize = convertFileSize(fileSizeInBytes);
						$(this).text(convertedSize);
					});
			$('.selectAll')
				.click(
					function() {
						var tableId = $(this).data('table');
						$(
							'#'
							+ tableId
							+ ' tbody input[type="checkbox"]')
							.prop(
								'checked',
								$(this).prop(
									'checked'));
					});
			$('#btn_upload').click(function() {
				$('#documentUpload').show();
			});
			$(document).on('click', '#closeModal', function() {
				$('#documentUpload').hide();
			});
		});
$('#documentHome').click(function() {
	window.location.href = "/documentLibrary";
})
