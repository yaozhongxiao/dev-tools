1. ���������ļ����°���3���ļ�,�ֱ�Ϊ��
    clang-format��clang-format���
    .clang-format��clang-format�����ļ���
    clangformat.py��clangformat��vi�������ļ���

2. ���Ƚ��ļ����µ�clang-format�������PATH��
    (cmd) export PATH=<clang-format���������õ�λ��>:$PATH
    ���ַ����ڹر��ն�֮��ͻ���ʧ�������etc/profile/���в������Է�ֹ��������ķ�����

3. ��.clang-format�����Լ��û��ĸ�Ŀ¼��
   ����(cmd)��cp <.clang-format���ڵ�Ŀ¼> <�Լ����������ĸ�Ŀ¼�±��磺~/>��

4. ��vi�������ļ�.vimrc��ĩβ���룬map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>��
    imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>������<path-to-this-file>Ϊclang-format.py��·����

5.1 ��vi�¶Դ�����и�ʽ��
    ��ô������vi�±����ͨ��Ctrl+k����ѡ�е����ݽ��и�ʽ�������Ҫѡ�ж��У�
    ����ͨ��visualģʽ��ѡ��Ҫ��ʽ��������,Ȼ����ctrl+k����Զ�ָ�������ݽ��и�ʽ����

5.2 ��cmd�¶Դ�����и�ʽ��
    clang-formatĬ������µ������ʽΪclang-format [options] [<file> ...]��
    ��cmd�¿���ʹ��clang-format  *.cpp/*.h(����(cmd:)clang-format test.h)���Զ�ָ�����ļ����и�ʽ����
	�����������������Ķ��ļ������޸ģ����ǻ�ͨ����׼������Ը�ʽ��֮��ĸ�ʽ����Ԥ����  
    ��cmd������clang-format  �Ci  [<file>����](����(cmd:)clang-format -i test.h test.cpp)���ָ����һ�������ļ����и�ʽ����
    ��cmd������clang-format  �Coutput-replacements-xml [<file>����]���Ƕ��޸ĵĵط����б�׼�����

6. ��ע
    Ҳ������cmd������clang-format �Chelp���Բ��Ҹ��������
    Ҳ����ͨ��http://clang.llvm.org/docs/ClangFormatStyleOptions.html
    ��http://clang.llvm.org/docs/ClangFormat.html��ҳ���鿴��������
    �Լ�����.clang-format���ò�����������������Ƶķ�ʽ����emacs��
	����д���ĵط��������ʿ��Է����ʼ�����shuanghong.dsh@alibaba-inc.com��