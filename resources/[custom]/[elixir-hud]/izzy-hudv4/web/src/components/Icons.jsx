export const statusIcons = {
	health: ({ color = '#FF4646', size = 12 }) => (
		<svg width={size - 2} height={size - 2} viewBox='0 0 18 17' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M8.80209 16.7046L7.55496 15.5692C3.12548 11.5526 0.201172 8.89493 0.201172 5.65238C0.201172 2.9947 2.28259 0.921875 4.93168 0.921875C6.42824 0.921875 7.86459 1.61855 8.80209 2.71087C9.73959 1.61855 11.1759 0.921875 12.6725 0.921875C15.3216 0.921875 17.403 2.9947 17.403 5.65238C17.403 8.89493 14.4787 11.5526 10.0492 15.5692L8.80209 16.7046Z'
				fill={color}
			/>
		</svg>
	),
	armor: ({ color = '#004ABA', size = 12 }) => (
		<svg width={size + 2} height={size + 2} viewBox='0 0 22 21' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M11.1698 19.2634C9.17725 18.7616 7.53218 17.6183 6.23459 15.8333C4.937 14.0483 4.28849 12.0667 4.28906 9.88836V4.6418L11.1698 2.06152L18.0505 4.6418V9.88836C18.0505 12.0673 17.402 14.0492 16.105 15.8342C14.808 17.6192 13.1629 18.7622 11.1698 19.2634Z'
				fill={color}
			/>
		</svg>
	),
	hunger: ({ color = '#FFA740', size = 18 }) => (
		<svg width={size - 2} height={size - 2} viewBox='0 0 19 18' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M2.98887 7.72803C2.44796 7.72803 2.01119 7.29127 2.01119 6.75035C2.01119 6.68651 2.01791 6.62604 2.03135 6.5622C2.20941 5.85666 3.58355 1.27734 9.53699 1.27734C15.4904 1.27734 16.8646 5.85666 17.0426 6.5622C17.0594 6.62604 17.0628 6.68651 17.0628 6.75035C17.0628 7.29127 16.626 7.72803 16.0851 7.72803H2.98887ZM5.77409 4.50269C5.77409 4.36012 5.71746 4.22339 5.61664 4.12258C5.51583 4.02177 5.3791 3.96513 5.23653 3.96513C5.09397 3.96513 4.95724 4.02177 4.85642 4.12258C4.75561 4.22339 4.69898 4.36012 4.69898 4.50269C4.69898 4.64526 4.75561 4.78199 4.85642 4.8828C4.95724 4.98361 5.09397 5.04024 5.23653 5.04024C5.3791 5.04024 5.51583 4.98361 5.61664 4.8828C5.71746 4.78199 5.77409 4.64526 5.77409 4.50269ZM13.8375 5.04024C13.98 5.04024 14.1168 4.98361 14.2176 4.8828C14.3184 4.78199 14.375 4.64526 14.375 4.50269C14.375 4.36012 14.3184 4.22339 14.2176 4.12258C14.1168 4.02177 13.98 3.96513 13.8375 3.96513C13.6949 3.96513 13.5582 4.02177 13.4573 4.12258C13.3565 4.22339 13.2999 4.36012 13.2999 4.50269C13.2999 4.64526 13.3565 4.78199 13.4573 4.8828C13.5582 4.98361 13.6949 5.04024 13.8375 5.04024ZM10.0746 3.42757C10.0746 3.285 10.0179 3.14827 9.9171 3.04746C9.81629 2.94665 9.67956 2.89002 9.53699 2.89002C9.39442 2.89002 9.25769 2.94665 9.15688 3.04746C9.05607 3.14827 8.99944 3.285 8.99944 3.42757C8.99944 3.57014 9.05607 3.70687 9.15688 3.80768C9.25769 3.90849 9.39442 3.96513 9.53699 3.96513C9.67956 3.96513 9.81629 3.90849 9.9171 3.80768C10.0179 3.70687 10.0746 3.57014 10.0746 3.42757ZM1.47363 10.4158C1.47363 9.52549 2.19598 8.80315 3.0863 8.80315H15.9877C16.878 8.80315 17.6004 9.52549 17.6004 10.4158C17.6004 11.3061 16.878 12.0285 15.9877 12.0285H3.0863C2.19598 12.0285 1.47363 11.3061 1.47363 10.4158ZM2.01119 13.6412C2.01119 13.3455 2.25309 13.1036 2.54875 13.1036H16.5252C16.8209 13.1036 17.0628 13.3455 17.0628 13.6412V14.1787C17.0628 15.3647 16.0986 16.3289 14.9126 16.3289H4.16142C2.97543 16.3289 2.01119 15.3647 2.01119 14.1787V13.6412Z'
				fill={color}
			/>
			<path
				d='M16.8342 6.61482L16.8341 6.61482L16.8347 6.61693C16.8446 6.65457 16.8478 6.69374 16.8478 6.75035C16.8478 7.17251 16.5073 7.51301 16.0851 7.51301H2.98887C2.56671 7.51301 2.22621 7.17251 2.22621 6.75035C2.22621 6.70379 2.23089 6.65933 2.24092 6.61051C2.32775 6.2683 2.70556 4.99062 3.77821 3.79906C4.84903 2.60953 6.6236 1.49237 9.53699 1.49237C12.4504 1.49237 14.225 2.60953 15.2958 3.79906C16.373 4.99568 16.7494 6.27915 16.8342 6.61482ZM5.98911 4.50269C5.98911 4.30309 5.90982 4.11167 5.76869 3.97053C5.62755 3.8294 5.43613 3.75011 5.23653 3.75011C5.03694 3.75011 4.84552 3.8294 4.70438 3.97053C4.56324 4.11167 4.48395 4.30309 4.48395 4.50269C4.48395 4.70228 4.56324 4.89371 4.70438 5.03484C4.84552 5.17598 5.03694 5.25527 5.23653 5.25527C5.43613 5.25527 5.62755 5.17598 5.76869 5.03484C5.90982 4.89371 5.98911 4.70228 5.98911 4.50269ZM13.8375 5.25527C14.037 5.25527 14.2285 5.17598 14.3696 5.03484C14.5107 4.89371 14.59 4.70228 14.59 4.50269C14.59 4.30309 14.5107 4.11167 14.3696 3.97053C14.2285 3.8294 14.037 3.75011 13.8375 3.75011C13.6379 3.75011 13.4464 3.8294 13.3053 3.97053C13.1642 4.11167 13.0849 4.30309 13.0849 4.50269C13.0849 4.70229 13.1642 4.89371 13.3053 5.03484C13.4464 5.17598 13.6379 5.25527 13.8375 5.25527ZM10.2896 3.42757C10.2896 3.22798 10.2103 3.03655 10.0691 2.89542C9.92801 2.75428 9.73659 2.67499 9.53699 2.67499C9.3374 2.67499 9.14597 2.75428 9.00484 2.89542C8.8637 3.03655 8.78441 3.22798 8.78441 3.42757C8.78441 3.62717 8.8637 3.81859 9.00484 3.95973C9.14597 4.10086 9.3374 4.18015 9.53699 4.18015C9.73659 4.18015 9.92801 4.10086 10.0691 3.95973C10.2103 3.81859 10.2896 3.62717 10.2896 3.42757ZM1.68866 10.4158C1.68866 9.64424 2.31473 9.01817 3.0863 9.01817H15.9877C16.7593 9.01817 17.3853 9.64424 17.3853 10.4158C17.3853 11.1874 16.7593 11.8135 15.9877 11.8135H3.0863C2.31473 11.8135 1.68866 11.1874 1.68866 10.4158ZM2.22621 13.6412C2.22621 13.4643 2.37184 13.3186 2.54875 13.3186H16.5252C16.7021 13.3186 16.8478 13.4643 16.8478 13.6412V14.1787C16.8478 15.246 15.9798 16.1139 14.9126 16.1139H4.16142C3.09419 16.1139 2.22621 15.246 2.22621 14.1787V13.6412Z'
				stroke={color}
				stroke-opacity='0.34'
				stroke-width='0.430046'
			/>
		</svg>
	),
	thirst: ({ color = '#00BAAA', size = 20 }) => (
		<svg width={size + 2} height={size + 2} viewBox='0 0 24 23' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M11.9031 19.2565C10.4204 19.2565 8.99839 18.6675 7.94995 17.619C6.90151 16.5706 6.3125 15.1486 6.3125 13.6659C6.3125 9.93884 11.9031 3.64941 11.9031 3.64941C11.9031 3.64941 17.4937 9.93884 17.4937 13.6659C17.4937 15.1486 16.9047 16.5706 15.8562 17.619C14.8078 18.6675 13.3858 19.2565 11.9031 19.2565Z'
				fill={color}
			/>
		</svg>
	),
	stamina: ({ color = '#A965FF', size = 18 }) => (
		<svg width={size} height={size} viewBox='0 0 22 22' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M14.7108 8.22181V17.6828C14.7108 18.139 14.5296 18.5766 14.207 18.8992C13.8844 19.2218 13.4468 19.403 12.9906 19.403H9.55026C9.09404 19.403 8.65651 19.2218 8.33391 18.8992C8.01131 18.5766 7.83008 18.139 7.83008 17.6828V8.22181C7.83008 6.62204 8.92239 5.2717 10.4104 4.89326V3.92136H8.69017V2.20117H13.8507V3.92136H12.1305V4.89326C13.6185 5.2717 14.7108 6.62204 14.7108 8.22181Z'
				fill={color}
			/>
		</svg>
	),
	stress: ({ color = '#FC8A4A', size = 18 }) => (
		<svg width={size - 2} height={size - 2} viewBox='0 0 14 16' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M7.8331 0.5C4.69143 0.5 2.1581 2.95833 1.99976 6.05L0.399764 8.15833C0.199764 8.41667 0.399764 8.83333 0.749764 8.83333H1.99976V11.3333C1.99976 12.2583 2.74143 13 3.66643 13H4.49976V15.5H10.3331V11.5917C12.3081 10.6583 13.6664 8.66667 13.6664 6.33333C13.6664 3.11667 11.0664 0.5 7.8331 0.5ZM11.2164 5.975L9.5831 6.40833L10.7831 7.61667C10.923 7.75722 11.0016 7.94749 11.0016 8.14583C11.0016 8.34418 10.923 8.53444 10.7831 8.675C10.6425 8.81494 10.4523 8.89351 10.2539 8.89351C10.0556 8.89351 9.86532 8.81494 9.72476 8.675L8.5081 7.475L8.0831 9.10833C7.9831 9.51667 7.56643 9.75 7.17476 9.64167C7.07898 9.61749 6.98899 9.57441 6.91008 9.51497C6.83116 9.45553 6.76492 9.38093 6.71524 9.29554C6.66556 9.21015 6.63344 9.11569 6.62076 9.01772C6.60809 8.91974 6.61512 8.82022 6.64143 8.725L7.0831 7.08333L5.44143 7.525C5.34621 7.55167 5.2466 7.55896 5.1485 7.54645C5.05041 7.53393 4.95582 7.50185 4.87035 7.45212C4.78487 7.40239 4.71024 7.33602 4.65088 7.25692C4.59152 7.17783 4.54864 7.08763 4.52476 6.99167C4.41643 6.6 4.64976 6.18333 5.0581 6.08333L6.69143 5.65833L5.49143 4.44167C5.36606 4.29848 5.29982 4.11298 5.30612 3.92277C5.31242 3.73256 5.3908 3.55185 5.52538 3.41728C5.65995 3.2827 5.84065 3.20432 6.03087 3.19802C6.22108 3.19172 6.40658 3.25796 6.54976 3.38333L7.7581 4.58333L8.19143 2.95C8.2148 2.85634 8.25643 2.76822 8.31393 2.69068C8.37143 2.61315 8.44368 2.54773 8.52652 2.49818C8.60936 2.44863 8.70117 2.41592 8.79668 2.40194C8.89219 2.38795 8.98953 2.39295 9.0831 2.41667C9.49976 2.525 9.7331 2.93333 9.6331 3.34167L9.19143 4.975L10.8248 4.53333C10.9216 4.50835 11.0225 4.50278 11.1215 4.51693C11.2205 4.53109 11.3158 4.5647 11.4017 4.61582C11.4877 4.66694 11.5627 4.73457 11.6225 4.8148C11.6822 4.89504 11.7255 4.9863 11.7498 5.08333C11.7735 5.17691 11.7785 5.27424 11.7645 5.36975C11.7505 5.46526 11.7178 5.55707 11.6682 5.63991C11.6187 5.72275 11.5533 5.795 11.4757 5.8525C11.3982 5.91 11.3101 5.95163 11.2164 5.975Z'
				fill={color}
			/>
		</svg>
	),
	mic: ({ color = '#FFFFFF', size = 18 }) => (
		<svg width={size + 2} height={size + 2} viewBox='0 0 21 22' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M10.6378 12.9529C9.92109 12.9529 9.31185 12.7021 8.81013 12.2004C8.30841 11.6986 8.05755 11.0894 8.05755 10.3727V5.21211C8.05755 4.49537 8.30841 3.88614 8.81013 3.38442C9.31185 2.8827 9.92109 2.63184 10.6378 2.63184C11.3546 2.63184 11.9638 2.8827 12.4655 3.38442C12.9672 3.88614 13.2181 4.49537 13.2181 5.21211V10.3727C13.2181 11.0894 12.9672 11.6986 12.4655 12.2004C11.9638 12.7021 11.3546 12.9529 10.6378 12.9529ZM9.77774 18.9736V16.3288C8.28691 16.1281 7.05411 15.4615 6.07934 14.3291C5.10457 13.1966 4.61719 11.8778 4.61719 10.3727H6.33737C6.33737 11.5625 6.75681 12.5768 7.59569 13.4157C8.43456 14.2545 9.44861 14.6737 10.6378 14.6731C11.827 14.6725 12.8414 14.2531 13.6808 13.4148C14.5203 12.5765 14.9394 11.5625 14.9383 10.3727H16.6585C16.6585 11.8778 16.1711 13.1966 15.1963 14.3291C14.2215 15.4615 12.9887 16.1281 11.4979 16.3288V18.9736H9.77774Z'
				fill={color}
				className='transition-colors'
			/>
		</svg>
	),
};

export const topInfoIcons = {
	cash: ({ style, size = '15' }) => (
		<svg width={size} height={size} viewBox='0 0 20 20' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M1.875 14.375H18.125V15.625H1.875V14.375ZM3.125 16.25H16.875V17.5H3.125V16.25ZM18.75 6.875C17.7558 6.87386 16.8026 6.47841 16.0996 5.77539C15.3966 5.07238 15.0011 4.11921 15 3.125V2.5H5V3.125C4.99886 4.11921 4.60341 5.07238 3.90039 5.77539C3.19738 6.47841 2.24421 6.87386 1.25 6.875H0.625V9.375H1.25C2.24421 9.37614 3.19738 9.77159 3.90039 10.4746C4.60341 11.1776 4.99886 12.1308 5 13.125V13.75H15V13.125C15.0011 12.1308 15.3966 11.1776 16.0996 10.4746C16.8026 9.77159 17.7558 9.37614 18.75 9.375H19.375V6.875H18.75ZM10 11.875C9.25832 11.875 8.5333 11.6551 7.91661 11.243C7.29993 10.831 6.81928 10.2453 6.53545 9.56006C6.25162 8.87484 6.17736 8.12084 6.32206 7.39341C6.46675 6.66598 6.8239 5.9978 7.34835 5.47335C7.8728 4.9489 8.54098 4.59175 9.26841 4.44706C9.99584 4.30236 10.7498 4.37662 11.4351 4.66045C12.1203 4.94428 12.706 5.42493 13.118 6.04161C13.5301 6.6583 13.75 7.38332 13.75 8.125C13.7489 9.11921 13.3534 10.0724 12.6504 10.7754C11.9474 11.4784 10.9942 11.8739 10 11.875Z'
				fill={style.color}
			/>
			<path
				d='M3.75 3.125V2.5H0.625V5.625H1.25C1.91282 5.62428 2.54828 5.36065 3.01697 4.89197C3.48565 4.42328 3.74928 3.78782 3.75 3.125ZM1.25 10.625H0.625V13.75H3.75V13.125C3.74928 12.4622 3.48565 11.8267 3.01697 11.358C2.54828 10.8893 1.91282 10.6257 1.25 10.625ZM18.75 5.625H19.375V2.5H16.25V3.125C16.2507 3.78782 16.5143 4.42328 16.983 4.89197C17.4517 5.36065 18.0872 5.62428 18.75 5.625ZM16.25 13.125V13.75H19.375V10.625H18.75C18.0872 10.6257 17.4517 10.8893 16.983 11.358C16.5143 11.8267 16.2507 12.4622 16.25 13.125Z'
				fill={style.color}
			/>
			<path d='M10 10.625C11.3807 10.625 12.5 9.50571 12.5 8.125C12.5 6.74429 11.3807 5.625 10 5.625C8.61929 5.625 7.5 6.74429 7.5 8.125C7.5 9.50571 8.61929 10.625 10 10.625Z' fill='#56FF67' />
		</svg>
	),
	bank: ({ style, size = '15' }) => (
		<svg width={size} height={size} viewBox='0 0 20 20' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M19.375 16.2504C19.375 16.4162 19.3092 16.5751 19.1919 16.6923C19.0747 16.8095 18.9158 16.8754 18.75 16.8754H1.25C1.08424 16.8754 0.925268 16.8095 0.808058 16.6923C0.690848 16.5751 0.625 16.4162 0.625 16.2504C0.625 16.0846 0.690848 15.9257 0.808058 15.8084C0.925268 15.6912 1.08424 15.6254 1.25 15.6254H18.75C18.9158 15.6254 19.0747 15.6912 19.1919 15.8084C19.3092 15.9257 19.375 16.0846 19.375 16.2504ZM1.27344 7.67071C1.23626 7.53964 1.24294 7.40001 1.29244 7.27308C1.34194 7.14615 1.43156 7.03888 1.54766 6.96758L9.67266 1.96758C9.77111 1.90705 9.88442 1.875 10 1.875C10.1156 1.875 10.2289 1.90705 10.3273 1.96758L18.4523 6.96758C18.5685 7.03879 18.6582 7.14599 18.7078 7.27286C18.7573 7.39974 18.7641 7.53935 18.7271 7.67043C18.69 7.80152 18.6111 7.9169 18.5024 7.99903C18.3938 8.08116 18.2612 8.12553 18.125 8.12539H16.25V13.1254H17.5C17.6658 13.1254 17.8247 13.1912 17.9419 13.3084C18.0592 13.4257 18.125 13.5846 18.125 13.7504C18.125 13.9162 18.0592 14.0751 17.9419 14.1923C17.8247 14.3095 17.6658 14.3754 17.5 14.3754H2.5C2.33424 14.3754 2.17527 14.3095 2.05806 14.1923C1.94085 14.0751 1.875 13.9162 1.875 13.7504C1.875 13.5846 1.94085 13.4257 2.05806 13.3084C2.17527 13.1912 2.33424 13.1254 2.5 13.1254H3.75V8.12539H1.875C1.7389 8.12544 1.6065 8.08106 1.49792 7.99899C1.38935 7.91692 1.31053 7.80166 1.27344 7.67071ZM11.25 12.5004C11.25 12.6662 11.3158 12.8251 11.4331 12.9423C11.5503 13.0595 11.7092 13.1254 11.875 13.1254C12.0408 13.1254 12.1997 13.0595 12.3169 12.9423C12.4342 12.8251 12.5 12.6662 12.5 12.5004V8.75039C12.5 8.58463 12.4342 8.42566 12.3169 8.30845C12.1997 8.19124 12.0408 8.12539 11.875 8.12539C11.7092 8.12539 11.5503 8.19124 11.4331 8.30845C11.3158 8.42566 11.25 8.58463 11.25 8.75039V12.5004ZM7.5 12.5004C7.5 12.6662 7.56585 12.8251 7.68306 12.9423C7.80027 13.0595 7.95924 13.1254 8.125 13.1254C8.29076 13.1254 8.44973 13.0595 8.56694 12.9423C8.68415 12.8251 8.75 12.6662 8.75 12.5004V8.75039C8.75 8.58463 8.68415 8.42566 8.56694 8.30845C8.44973 8.19124 8.29076 8.12539 8.125 8.12539C7.95924 8.12539 7.80027 8.19124 7.68306 8.30845C7.56585 8.42566 7.5 8.58463 7.5 8.75039V12.5004Z'
				fill={style.color}
			/>
		</svg>
	),
	job: () => (
		<svg width='20' height='20' viewBox='0 0 20 20' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M15.8337 5H13.3337V4.16667C13.3337 3.25 12.5837 2.5 11.667 2.5H8.33366C7.41699 2.5 6.66699 3.25 6.66699 4.16667V5H4.16699C2.75033 5 1.66699 6.08333 1.66699 7.5V15C1.66699 16.4167 2.75033 17.5 4.16699 17.5H15.8337C17.2503 17.5 18.3337 16.4167 18.3337 15V7.5C18.3337 6.08333 17.2503 5 15.8337 5ZM8.33366 4.16667H11.667V5H8.33366V4.16667ZM16.667 15C16.667 15.5 16.3337 15.8333 15.8337 15.8333H4.16699C3.66699 15.8333 3.33366 15.5 3.33366 15V10.3333L7.25033 11.6667H12.5003C12.5837 11.6667 12.667 11.6667 12.7503 11.5833L16.667 10.25V15Z'
				fill='white'
				fill-opacity='0.46'
			/>
		</svg>
	),
};

export const DatePicker = ({ size = '15' }) => {
	return (
		<svg width={size} height={size} viewBox='0 0 15 16' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M1.25 6.125C1.25 4.94625 1.25 4.3575 1.61625 3.99125C1.9825 3.625 2.57125 3.625 3.75 3.625H11.25C12.4287 3.625 13.0175 3.625 13.3837 3.99125C13.75 4.3575 13.75 4.94625 13.75 6.125C13.75 6.41937 13.75 6.56687 13.6587 6.65875C13.5669 6.75 13.4187 6.75 13.125 6.75H1.875C1.58062 6.75 1.43312 6.75 1.34125 6.65875C1.25 6.56687 1.25 6.41875 1.25 6.125ZM1.25 11.75C1.25 12.9288 1.25 13.5175 1.61625 13.8837C1.9825 14.25 2.57125 14.25 3.75 14.25H11.25C12.4287 14.25 13.0175 14.25 13.3837 13.8837C13.75 13.5175 13.75 12.9288 13.75 11.75V8.625C13.75 8.33063 13.75 8.18313 13.6587 8.09125C13.5669 8 13.4187 8 13.125 8H1.875C1.58062 8 1.43312 8 1.34125 8.09125C1.25 8.18313 1.25 8.33125 1.25 8.625V11.75Z'
				fill='white'
				fill-opacity='0.4'
			/>
			<path d='M4.375 2.375V4.25M10.625 2.375V4.25' stroke='white' stroke-opacity='0.46' stroke-width='1.25' stroke-linecap='round' />
		</svg>
	);
};

export const Clock = ({ size = '13' }) => {
	return (
		<svg width={size} height={size} viewBox='0 0 13 13' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M6.50065 1.08301C5.78932 1.08301 5.08496 1.22311 4.42778 1.49533C3.7706 1.76754 3.17347 2.16653 2.67049 2.66951C1.65467 3.68533 1.08398 5.06308 1.08398 6.49967C1.08398 7.93626 1.65467 9.31401 2.67049 10.3298C3.17347 10.8328 3.7706 11.2318 4.42778 11.504C5.08496 11.7762 5.78932 11.9163 6.50065 11.9163C7.93724 11.9163 9.31499 11.3457 10.3308 10.3298C11.3466 9.31401 11.9173 7.93626 11.9173 6.49967C11.9173 5.78835 11.7772 5.08399 11.505 4.42681C11.2328 3.76963 10.8338 3.1725 10.3308 2.66951C9.82783 2.16653 9.2307 1.76754 8.57352 1.49533C7.91634 1.22311 7.21198 1.08301 6.50065 1.08301ZM8.77565 8.77467L5.95898 7.04134V3.79134H6.77148V6.60801L9.20898 8.07051L8.77565 8.77467Z'
				fill='white'
				fill-opacity='0.4'
			/>
		</svg>
	);
};

export const Ammo = () => {
	return (
		<svg width='12' height='12' viewBox='0 0 10 10' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M5.83268 9.16634H4.16602V8.74967H5.83268V9.16634ZM5.41602 4.16634V2.91634H4.58268V4.16634L4.16602 4.79134V8.33301H5.83268V4.79134L5.41602 4.16634ZM4.99935 0.833008C4.99935 0.833008 4.58268 1.24967 4.58268 2.08301V2.49967H5.41602V2.08301C5.41602 2.08301 5.41602 1.24967 4.99935 0.833008Z'
				fill='white'
			/>
			<path
				d='M8.33268 9.16634H6.66602V8.74967H8.33268V9.16634ZM7.91602 4.16634V2.91634H7.08268V4.16634L6.66602 4.79134V8.33301H8.33268V4.79134L7.91602 4.16634ZM7.49935 0.833008C7.49935 0.833008 7.08268 1.24967 7.08268 2.08301V2.49967H7.91602V2.08301C7.91602 2.08301 7.91602 1.24967 7.49935 0.833008Z'
				fill='white'
			/>
			<path
				d='M3.33268 9.16634H1.66602V8.74967H3.33268V9.16634ZM2.91602 4.16634V2.91634H2.08268V4.16634L1.66602 4.79134V8.33301H3.33268V4.79134L2.91602 4.16634ZM2.49935 0.833008C2.49935 0.833008 2.08268 1.24967 2.08268 2.08301V2.49967H2.91602V2.08301C2.91602 2.08301 2.91602 1.24967 2.49935 0.833008Z'
				fill='white'
			/>
		</svg>
	);
};

export const LeftSignal = ({ active }) => {
	return (
		<svg width='25' height='25' viewBox='0 0 21 21' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				className={`transition-colors duration-300 ${active && 'animate-color'}`}
				d='M20.2554 6.73419L20.2554 14.1385L10.383 14.1385L10.383 20.1113L0.708007 10.4364L10.383 0.761379L10.383 6.73419L20.2554 6.73419Z'
				fill={!active && '#6AFF7050'}
			/>
		</svg>
	);
};

export const RightSignal = ({ active }) => {
	return (
		<svg style={{ transform: 'rotateY(180deg)' }} width='25' height='25' viewBox='0 0 21 21' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				className={`transition-colors duration-300 ${active && 'animate-color'}`}
				d='M20.2554 6.73419L20.2554 14.1385L10.383 14.1385L10.383 20.1113L0.708007 10.4364L10.383 0.761379L10.383 6.73419L20.2554 6.73419Z'
				fill={!active && '#6AFF7050'}
			/>
		</svg>
	);
};

export const Headlights = ({ active }) => {
	return (
		<svg width='25' height='25' viewBox='0 0 21 21' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M11.3763 4.18066C7.95893 4.18066 7.95893 16.4832 11.3763 16.4832C14.7937 16.4832 19.0654 14.1765 19.0654 10.3319C19.0654 6.48739 14.7937 4.18066 11.3763 4.18066ZM11.4617 14.7745C11.12 14.4328 10.522 12.895 10.522 10.3319C10.522 7.76891 11.12 6.23109 11.4617 5.88935C13.9393 5.97479 17.3567 7.51261 17.3567 10.3319C17.3567 13.1513 13.9393 14.6891 11.4617 14.7745ZM1.97852 4.35153H8.3861C8.21523 4.69327 7.95893 5.03501 7.87349 5.54761C7.78806 5.71848 7.78806 5.88935 7.70262 6.06022H1.97852V4.35153ZM7.10458 9.4776H1.97852V7.76891H7.27545C7.19002 8.28152 7.19002 8.87956 7.10458 9.4776ZM7.70262 14.6037C7.87349 15.2871 8.1298 15.7997 8.47153 16.3124H2.06395V14.6037H7.70262ZM7.27545 12.895H1.97852V11.1863H7.10458C7.19002 11.7843 7.19002 12.3824 7.27545 12.895Z'
				fill={active == 2 ? '#8AB2FF' : active == 1 ? '#8AB2FFAB' : '#8AB2FF50'}
				className='transition-colors duration-300'
			/>
		</svg>
	);
};

export const Engine = ({ active, scale = '4' }) => {
	return (
		<svg width='25' height='25' viewBox='0 0 22 16' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M6.5384 0.719727V2.61827H9.38622V4.51681H6.5384L4.63986 6.41536V9.26317H2.74132V6.41536H0.842773V14.0095H2.74132V11.1617H4.63986V14.0095H7.48767L9.38622 15.9081H16.9804V12.111H18.8789V14.9588H21.7267V5.46608H18.8789V8.3139H16.9804V4.51681H11.2848V2.61827H14.1326V0.719727H6.5384Z'
				fill={active > 40 ? '#6AFF70' : active <= 40 && active > 20 ? '#FAB639' : '#fa3939'}
				className='transition-colors duration-300'
			/>
		</svg>
	);
};

export const ABS = ({ active }) => {
	return (
		<svg width='25' height='25' viewBox='0 0 22 17' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M21.9549 8.57037C21.9549 11.5554 20.7465 14.2608 18.7986 16.2357L17.8246 15.2618C19.5381 13.5303 20.6022 11.1856 20.6022 8.57037C20.6022 5.96415 19.5381 3.61043 17.8246 1.87896L18.7986 0.905006C20.7465 2.87996 21.9549 5.58539 21.9549 8.57037ZM18.3477 6.40603V4.96314H15.4619C14.6683 4.96314 14.019 5.61244 14.019 6.40603V7.84893C14.019 8.23161 14.171 8.59861 14.4416 8.86921C14.7122 9.1398 15.0792 9.29182 15.4619 9.29182H16.9048V10.7347H14.019V12.1776H16.9048C17.6984 12.1776 18.3477 11.5283 18.3477 10.7347V9.29182C18.3477 8.90914 18.1957 8.54213 17.9251 8.27154C17.6545 8.00094 17.2875 7.84893 16.9048 7.84893H15.4619V6.40603H18.3477ZM7.90475 3.15953C8.85164 2.59139 9.95185 2.25772 11.1332 2.25772C12.3146 2.25772 13.4148 2.59139 14.3617 3.15953H17.1663C15.6873 1.5002 13.532 0.454102 11.1332 0.454102C8.73441 0.454102 6.57909 1.5002 5.10012 3.15953H7.90475ZM12.2154 8.57037C12.7925 8.57037 13.2976 9.07539 13.2976 9.65254V10.7347C13.2976 10.9242 13.2602 11.1118 13.1877 11.2869C13.1152 11.4619 13.0089 11.621 12.8749 11.755C12.741 11.889 12.5819 11.9953 12.4068 12.0678C12.2318 12.1403 12.0441 12.1776 11.8547 12.1776H8.96888V4.96314H11.8547C12.2373 4.96314 12.6044 5.11516 12.8749 5.38575C13.1455 5.65635 13.2976 6.02336 13.2976 6.40603V7.4882C13.2976 8.06536 12.7925 8.57037 12.2154 8.57037ZM11.8547 9.29182H10.4118V10.7347H11.8547V9.29182ZM11.8547 6.40603H10.4118V7.84893H11.8547V6.40603ZM4.4418 1.87896L3.46785 0.905006C1.51995 2.87996 0.311523 5.58539 0.311523 8.57037C0.311523 11.5554 1.51995 14.2608 3.46785 16.2357L4.4418 15.2618C2.72837 13.5303 1.66424 11.1856 1.66424 8.57037C1.66424 5.96415 2.72837 3.61043 4.4418 1.87896ZM6.80454 12.1776V9.29182H5.36165V12.1776H3.91876V6.40603C3.91876 6.02336 4.07077 5.65635 4.34137 5.38575C4.61196 5.11516 4.97897 4.96314 5.36165 4.96314H6.80454C7.59813 4.96314 8.24743 5.61244 8.24743 6.40603V12.1776H6.80454ZM6.80454 7.84893V6.40603H5.36165V7.84893H6.80454ZM14.3617 13.9812C13.4148 14.5494 12.3146 14.883 11.1332 14.883C9.99502 14.882 8.8787 14.5702 7.90475 13.9812H5.10012C6.57909 15.6405 8.73441 16.6866 11.1332 16.6866C13.532 16.6866 15.6873 15.6405 17.1663 13.9812H14.3617Z'
				fill={active ? '#FF4F4F' : '#FF4F4F50'}
				className='transition-colors duration-300'
			/>
		</svg>
	);
};

export const Seatbelt = ({ active }) => {
	return (
		<svg width='25' height='25' viewBox='0 0 17 20' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M8.521 0.629883C9.02452 0.629883 9.50743 0.829907 9.86347 1.18595C10.2195 1.542 10.4195 2.0249 10.4195 2.52843C10.4195 3.58212 9.57469 4.42697 8.521 4.42697C8.01747 4.42697 7.53457 4.22694 7.17853 3.8709C6.82248 3.51485 6.62246 3.03195 6.62246 2.52843C6.62246 2.0249 6.82248 1.542 7.17853 1.18595C7.53457 0.829907 8.01747 0.629883 8.521 0.629883ZM8.89122 12.7711C10.2397 12.7658 11.5871 12.8451 12.9256 13.0084C12.9826 10.4264 12.7547 8.14811 12.3181 7.27478C12.1947 7.01848 12.0238 6.80015 11.8434 6.61029L4.18283 13.1793C5.47384 12.9704 7.09709 12.7711 8.89122 12.7711ZM4.21131 14.869C4.33471 16.5207 4.58152 18.1914 4.98022 19.6153H6.94521C6.66992 18.78 6.47057 17.8022 6.31869 16.7675C6.31869 16.7675 8.521 16.3498 10.7233 16.7675C10.5714 17.8022 10.3721 18.78 10.0968 19.6153H12.0618C12.4795 18.1439 12.7263 16.3973 12.8497 14.6696C11.5361 14.5118 10.2143 14.4325 8.89122 14.4323C7.05912 14.4323 5.46434 14.6316 4.21131 14.869ZM8.521 5.37624C8.521 5.37624 5.67318 5.37624 4.72391 7.27478C4.40116 7.92029 4.19232 9.31572 4.12587 11.0339L10.3436 5.69899C9.40382 5.37624 8.521 5.37624 8.521 5.37624ZM14.7577 4.11371L13.6755 2.85118L10.3436 5.70849C10.8657 5.88885 11.4163 6.17363 11.8434 6.61029L14.7577 4.11371ZM16.7512 13.7583C16.6657 13.7298 15.2988 13.2837 12.9256 13.0084C12.9161 13.5495 12.8876 14.1095 12.8497 14.6696C14.9855 14.9354 16.2101 15.3436 16.2291 15.3436L16.7512 13.7583ZM4.12587 11.0339L0.385742 14.2424L1.23059 15.6474C1.24958 15.6379 2.35073 15.2107 4.21131 14.869C4.10689 13.5305 4.07841 12.211 4.12587 11.0339Z'
				fill={active ? '#6AFF70' : '#6AFF7050'}
				className='transition-colors duration-300'
			/>
		</svg>
	);
};

export const StatusIcon = () => {
	return (
		<svg width='18' height='18' viewBox='0 0 18 18' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<g clip-path='url(#clip0_3820_403)'>
				<path
					fill-rule='evenodd'
					clip-rule='evenodd'
					d='M9.00018 17.182C11.1701 17.182 13.2512 16.32 14.7856 14.7856C16.32 13.2512 17.182 11.1701 17.182 9.00018C17.182 6.83022 16.32 4.74915 14.7856 3.21476C13.2512 1.68037 11.1701 0.818359 9.00018 0.818359C6.83022 0.818359 4.74915 1.68037 3.21476 3.21476C1.68037 4.74915 0.818359 6.83022 0.818359 9.00018C0.818359 11.1701 1.68037 13.2512 3.21476 14.7856C4.74915 16.32 6.83022 17.182 9.00018 17.182ZM4.90927 7.29563C4.90927 7.02439 5.01702 6.76425 5.20882 6.57245C5.40062 6.38066 5.66075 6.2729 5.932 6.2729H12.0684C12.3396 6.2729 12.5997 6.38066 12.7915 6.57245C12.9833 6.76425 13.0911 7.02439 13.0911 7.29563C13.0911 7.56688 12.9833 7.82701 12.7915 8.01881C12.5997 8.21061 12.3396 8.31836 12.0684 8.31836H5.932C5.66075 8.31836 5.40062 8.21061 5.20882 8.01881C5.01702 7.82701 4.90927 7.56688 4.90927 7.29563ZM4.90927 10.7047C4.90927 10.4335 5.01702 10.1733 5.20882 9.98155C5.40062 9.78975 5.66075 9.682 5.932 9.682H10.7047C10.976 9.682 11.2361 9.78975 11.4279 9.98155C11.6197 10.1733 11.7275 10.4335 11.7275 10.7047C11.7275 10.976 11.6197 11.2361 11.4279 11.4279C11.2361 11.6197 10.976 11.7275 10.7047 11.7275H5.932C5.66075 11.7275 5.40062 11.6197 5.20882 11.4279C5.01702 11.2361 4.90927 10.976 4.90927 10.7047Z'
					fill='white'
				/>
			</g>
			<defs>
				<clipPath id='clip0_3820_403'>
					<rect width='16.3636' height='16.3636' fill='white' transform='translate(0.818359 0.818359)' />
				</clipPath>
			</defs>
		</svg>
	);
};

export const SpeedoMeterIcon = () => {
	return (
		<svg width='19' height='19' viewBox='0 0 19 19' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M8.27259 12.2712C8.60245 12.601 9.01808 12.7562 9.51947 12.7367C10.0209 12.7171 10.3837 12.5356 10.608 12.192L15.0413 5.54199L8.39134 9.97533C8.04829 10.2128 7.8604 10.5722 7.82767 11.0536C7.79495 11.5349 7.94326 11.9408 8.27259 12.2712ZM4.03717 15.8337C3.7469 15.8337 3.47984 15.7709 3.23601 15.6452C2.99217 15.5196 2.79742 15.3317 2.65176 15.0816C2.3087 14.4614 2.04481 13.8183 1.86009 13.1523C1.67537 12.4862 1.58301 11.7967 1.58301 11.0837C1.58301 9.98852 1.79095 8.95935 2.20684 7.99616C2.62273 7.03297 3.18666 6.19512 3.89863 5.48262C4.61113 4.77012 5.44898 4.20619 6.41217 3.79083C7.37537 3.37546 8.40454 3.16752 9.49967 3.16699C10.5816 3.16699 11.5976 3.37151 12.5476 3.78053C13.4976 4.18956 14.3288 4.74716 15.0413 5.45333C15.7538 6.15896 16.3212 6.98362 16.7434 7.92728C17.1656 8.87095 17.3834 9.88349 17.3966 10.9649C17.4097 11.6906 17.3274 12.3999 17.1495 13.0929C16.9717 13.7859 16.6978 14.4488 16.3278 15.0816C16.1827 15.3323 15.9882 15.5204 15.7443 15.646C15.5005 15.7716 15.2329 15.8342 14.9416 15.8337H4.03717Z'
				fill='white'
			/>
		</svg>
	);
};

export const Arrow = () => {
	return (
		<svg width='9' height='22' viewBox='0 0 9 22' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M8.60593 10.4308L1.82219 0.632056C1.26416 -0.173997 0 0.220896 0 1.20127V20.7987C0 21.7791 1.26415 22.174 1.82219 21.3679L8.60593 11.5692C8.84301 11.2268 8.84301 10.7732 8.60593 10.4308Z'
				fill='white'
			/>
		</svg>
	);
};

export const Save = () => {
	return (
		<svg width='24' height='24' viewBox='0 0 24 24' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M21 7V21H3V3H17L21 7ZM12 18C12.8333 18 13.5417 17.7083 14.125 17.125C14.7083 16.5417 15 15.8333 15 15C15 14.1667 14.7083 13.4583 14.125 12.875C13.5417 12.2917 12.8333 12 12 12C11.1667 12 10.4583 12.2917 9.875 12.875C9.29167 13.4583 9 14.1667 9 15C9 15.8333 9.29167 16.5417 9.875 17.125C10.4583 17.7083 11.1667 18 12 18ZM6 10H15V6H6V10Z'
				fill='#ADFFA6'
				fill-opacity='0.6'
			/>
		</svg>
	);
};

export const MoveIt = () => {
	return (
		<svg width='19' height='19' viewBox='0 0 19 19' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<g clip-path='url(#clip0_3820_612)'>
				<path
					d='M6.70114 5.30999C6.55272 5.16153 6.46935 4.96021 6.46935 4.75028C6.46935 4.54036 6.55272 4.33904 6.70114 4.19058L8.88455 2.00716C8.96542 1.92625 9.06144 1.86207 9.16712 1.81828C9.2728 1.77449 9.38608 1.75195 9.50047 1.75195C9.61486 1.75195 9.72814 1.77449 9.83382 1.81828C9.9395 1.86207 10.0355 1.92625 10.1164 2.00716L12.299 4.19058C12.3746 4.2636 12.4349 4.35096 12.4764 4.44755C12.5179 4.54413 12.5398 4.64802 12.5407 4.75313C12.5416 4.85825 12.5216 4.9625 12.4817 5.05979C12.4419 5.15708 12.3832 5.24547 12.3088 5.31981C12.2345 5.39414 12.1461 5.45292 12.0488 5.49273C11.9515 5.53253 11.8473 5.55256 11.7422 5.55165C11.637 5.55074 11.5332 5.5289 11.4366 5.48741C11.34 5.44592 11.2526 5.3856 11.1796 5.30999L10.2921 4.42253V8.70862H14.5782L13.6908 7.82116C13.5422 7.67271 13.4587 7.47134 13.4586 7.26133C13.4586 7.05133 13.5419 6.8499 13.6904 6.70135C13.8388 6.5528 14.0402 6.4693 14.2502 6.46923C14.4602 6.46915 14.6616 6.55251 14.8102 6.70095L16.9936 8.88437C17.0745 8.96524 17.1387 9.06125 17.1825 9.16694C17.2263 9.27262 17.2488 9.38589 17.2488 9.50028C17.2488 9.61468 17.2263 9.72795 17.1825 9.83363C17.1387 9.93931 17.0745 10.0353 16.9936 10.1162L14.8102 12.2996C14.6616 12.4481 14.4602 12.5314 14.2502 12.5313C14.0402 12.5313 13.8388 12.4478 13.6904 12.2992C13.5419 12.1507 13.4586 11.9492 13.4586 11.7392C13.4587 11.5292 13.5422 11.3279 13.6908 11.1794L14.5782 10.292H10.2921V14.578L11.1796 13.6906C11.3289 13.5464 11.5289 13.4666 11.7365 13.4684C11.944 13.4702 12.1426 13.5534 12.2894 13.7002C12.4361 13.847 12.5194 14.0456 12.5212 14.2531C12.523 14.4607 12.4432 14.6607 12.299 14.81L10.1164 16.9934C10.0355 17.0743 9.9395 17.1385 9.83382 17.1823C9.72814 17.2261 9.61486 17.2486 9.50047 17.2486C9.38608 17.2486 9.2728 17.2261 9.16712 17.1823C9.06144 17.1385 8.96542 17.0743 8.88455 16.9934L6.70114 14.81C6.62763 14.7364 6.56934 14.6491 6.52958 14.553C6.48982 14.457 6.46938 14.354 6.46941 14.25C6.46945 14.146 6.48997 14.0431 6.52979 13.947C6.56962 13.851 6.62798 13.7637 6.70153 13.6902C6.77509 13.6167 6.8624 13.5584 6.95848 13.5186C7.05456 13.4789 7.15754 13.4584 7.26152 13.4585C7.3655 13.4585 7.46846 13.479 7.56452 13.5188C7.66057 13.5587 7.74784 13.617 7.82134 13.6906L8.70801 14.578V10.292H4.42351L5.31097 11.1794C5.38452 11.2529 5.44288 11.3402 5.48271 11.4362C5.52253 11.5323 5.54305 11.6352 5.54309 11.7392C5.54312 11.8432 5.52268 11.9462 5.48292 12.0423C5.44316 12.1384 5.38487 12.2257 5.31136 12.2992C5.23786 12.3728 5.15059 12.4311 5.05454 12.471C4.95848 12.5108 4.85552 12.5313 4.75154 12.5313C4.64756 12.5314 4.54458 12.5109 4.4485 12.4712C4.35242 12.4314 4.26511 12.3731 4.19155 12.2996L2.00814 10.1162C1.92723 10.0353 1.86305 9.93931 1.81926 9.83363C1.77547 9.72795 1.75293 9.61468 1.75293 9.50028C1.75293 9.38589 1.77547 9.27262 1.81926 9.16694C1.86305 9.06125 1.92723 8.96524 2.00814 8.88437L4.19155 6.70095C4.34021 6.55261 4.5417 6.4694 4.7517 6.46962C4.96171 6.46985 5.16303 6.55348 5.31136 6.70214C5.4597 6.85079 5.54291 7.05228 5.54269 7.26229C5.54247 7.4723 5.45883 7.67361 5.31018 7.82195L4.42272 8.70862H8.7088V4.42333L7.82134 5.30999C7.74782 5.3836 7.66051 5.44199 7.5644 5.48183C7.46829 5.52167 7.36528 5.54218 7.26124 5.54218C7.1572 5.54218 7.05419 5.52167 6.95808 5.48183C6.86197 5.44199 6.77466 5.3836 6.70114 5.30999Z'
					fill='#C7D0FF'
					fill-opacity='0.63'
				/>
			</g>
			<defs>
				<clipPath id='clip0_3820_612'>
					<rect width='19' height='19' fill='white' />
				</clipPath>
			</defs>
		</svg>
	);
};

export const DefaultAll = () => {
	return (
		<svg width='20' height='20' viewBox='0 0 20 20' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M9.57021 12.7596C10.9028 12.7596 11.9627 11.6981 11.9627 10.3671C11.9627 9.03607 10.9028 7.97461 9.57021 7.97461C8.2376 7.97461 7.17773 9.03607 7.17773 10.3671C7.17773 11.6981 8.2376 12.7596 9.57021 12.7596Z'
				fill='white'
				fill-opacity='0.63'
			/>
			<path
				d='M16.6015 8.92048C16.4136 8.00205 16.0463 7.1297 15.5209 6.35336C15.0046 5.58958 14.3467 4.93177 13.583 4.41545C12.8065 3.89017 11.9342 3.52298 11.0158 3.33485C10.5334 3.23702 10.0423 3.18892 9.55006 3.1913V1.59473L6.38003 3.9872L9.55006 6.37967V4.78629C9.93605 4.78469 10.322 4.82138 10.6945 4.89793C11.4082 5.0442 12.0862 5.32954 12.6898 5.73769C13.285 6.13902 13.7973 6.65132 14.1986 7.24655C14.8217 8.16783 15.154 9.25491 15.1524 10.3671C15.1523 11.1135 15.0032 11.8523 14.7138 12.5403C14.5731 12.8717 14.4011 13.1889 14.2002 13.4877C13.9986 13.7847 13.7695 14.0621 13.516 14.3163C12.744 15.0868 11.764 15.6154 10.6961 15.8371C9.95337 15.9871 9.18822 15.9871 8.44554 15.8371C7.73143 15.6907 7.05315 15.4051 6.44942 14.9966C5.85487 14.5956 5.34313 14.0838 4.94216 13.4893C4.31976 12.567 3.98732 11.4798 3.98756 10.3671H2.39258C2.39343 11.7976 2.82074 13.1953 3.61992 14.3817C4.13657 15.1442 4.79371 15.8014 5.55623 16.318C6.74099 17.1199 8.13939 17.5472 9.57 17.5445C10.0559 17.5445 10.5405 17.4956 11.0166 17.3986C11.9343 17.2091 12.8061 16.842 13.583 16.318C13.9644 16.061 14.3199 15.7675 14.6444 15.4416C14.9694 15.1157 15.2631 14.76 15.5217 14.3793C16.3229 13.1949 16.7499 11.7971 16.7474 10.3671C16.7474 9.88124 16.6985 9.39659 16.6015 8.92048Z'
				fill='white'
				fill-opacity='0.63'
			/>
		</svg>
	);
};

export const Location = () => {
	return (
		<svg width='9' height='13' viewBox='0 0 9 13' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M4.5 6.1875C4.0856 6.1875 3.68817 6.02288 3.39515 5.72985C3.10212 5.43683 2.9375 5.0394 2.9375 4.625C2.9375 4.2106 3.10212 3.81317 3.39515 3.52015C3.68817 3.22712 4.0856 3.0625 4.5 3.0625C4.9144 3.0625 5.31183 3.22712 5.60485 3.52015C5.89788 3.81317 6.0625 4.2106 6.0625 4.625C6.0625 4.83019 6.02208 5.03337 5.94356 5.22294C5.86504 5.41251 5.74995 5.58476 5.60485 5.72985C5.45976 5.87495 5.28751 5.99004 5.09794 6.06856C4.90837 6.14708 4.70519 6.1875 4.5 6.1875ZM4.5 0.25C3.33968 0.25 2.22688 0.710936 1.40641 1.53141C0.585936 2.35188 0.125 3.46468 0.125 4.625C0.125 7.90625 4.5 12.75 4.5 12.75C4.5 12.75 8.875 7.90625 8.875 4.625C8.875 3.46468 8.41406 2.35188 7.59359 1.53141C6.77312 0.710936 5.66032 0.25 4.5 0.25Z'
				fill='white'
			/>
		</svg>
	);
};

export const Location2 = () => {
	return (
		<svg width='12' height='18' viewBox='0 0 12 18' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M6.00033 8.58366C5.44779 8.58366 4.91789 8.36417 4.52719 7.97346C4.13649 7.58276 3.91699 7.05286 3.91699 6.50033C3.91699 5.94779 4.13649 5.41789 4.52719 5.02719C4.91789 4.63649 5.44779 4.41699 6.00033 4.41699C6.55286 4.41699 7.08276 4.63649 7.47346 5.02719C7.86417 5.41789 8.08366 5.94779 8.08366 6.50033C8.08366 6.77391 8.02977 7.04482 7.92508 7.29758C7.82038 7.55034 7.66692 7.78001 7.47346 7.97346C7.28001 8.16692 7.05034 8.32038 6.79758 8.42507C6.54482 8.52977 6.27391 8.58366 6.00033 8.58366ZM6.00033 0.666992C4.45323 0.666992 2.9695 1.28157 1.87554 2.37554C0.781574 3.4695 0.166992 4.95323 0.166992 6.50033C0.166992 10.8753 6.00033 17.3337 6.00033 17.3337C6.00033 17.3337 11.8337 10.8753 11.8337 6.50033C11.8337 4.95323 11.2191 3.4695 10.1251 2.37554C9.03115 1.28157 7.54742 0.666992 6.00033 0.666992Z'
				fill='white'
			/>
		</svg>
	);
};

export const Microphone = () => {
	return (
		<svg width='17' height='17' viewBox='0 0 14 14' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M7.00033 8.16699C6.51421 8.16699 6.10102 7.99685 5.76074 7.65658C5.42046 7.3163 5.25033 6.9031 5.25033 6.41699V2.91699C5.25033 2.43088 5.42046 2.01769 5.76074 1.67741C6.10102 1.33713 6.51421 1.16699 7.00033 1.16699C7.48644 1.16699 7.89963 1.33713 8.23991 1.67741C8.58019 2.01769 8.75033 2.43088 8.75033 2.91699V6.41699C8.75033 6.9031 8.58019 7.3163 8.23991 7.65658C7.89963 7.99685 7.48644 8.16699 7.00033 8.16699ZM6.41699 12.2503V10.4566C5.40588 10.3205 4.56977 9.86838 3.90866 9.10033C3.24755 8.33227 2.91699 7.43783 2.91699 6.41699H4.08366C4.08366 7.22394 4.36813 7.91188 4.93708 8.48083C5.50602 9.04977 6.19377 9.33405 7.00033 9.33366C7.80688 9.33327 8.49483 9.0488 9.06416 8.48024C9.63349 7.91169 9.91777 7.22394 9.91699 6.41699H11.0837C11.0837 7.43783 10.7531 8.33227 10.092 9.10033C9.43088 9.86838 8.59477 10.3205 7.58366 10.4566V12.2503H6.41699Z'
				fill='white'
			/>
		</svg>
	);
};