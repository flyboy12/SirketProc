using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SirketProc
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        int selectedGroup;
        SirketEntities conn = new SirketEntities(); 
        private void groupBox1_Enter(object sender, EventArgs e)
        {
            GorevListele();
            selectedGroup = 0;
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {
 ElemanListele();
            selectedGroup = 1;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Gorev ekle
            conn.GorevEkle(textBox1.Text,textBox2.Text,Convert.ToDecimal(textBox3.Text),Convert.ToInt32(textBox4.Text),textBox5.Text);
            conn.SaveChanges();
            dataGridView1.DataSource = conn.GorevListele().ToList();
            GorevTemizleBox(); 
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //Gorev Silme
            conn.GorevSil(Convert.ToInt32(textBox1.Tag));
            conn.SaveChanges();
            dataGridView1.DataSource = conn.GorevListele().ToList();
            GorevTemizleBox();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            conn.GorevYenile(Convert.ToInt32(textBox1.Tag), textBox1.Text, textBox2.Text, Convert.ToDecimal(textBox3.Text), Convert.ToInt32(textBox4.Text), textBox5.Text);
            conn.SaveChanges();
            dataGridView1.DataSource = conn.GorevListele().ToList();
            GorevTemizleBox();
            //Gorev Güncelleme
        }

        private void button6_Click(object sender, EventArgs e)
        {
            conn.ElemanEkle(textBox6.Text, textBox7.Text, Convert.ToDecimal(textBox8.Text),textBox9.Text, Convert.ToInt32(textBox10.Text));
            conn.SaveChanges();
            dataGridView1.DataSource = conn.ElemanListele().ToList();
            ElemanTemizleBox();
            //Eleman Ekleme
        }

        private void button5_Click(object sender, EventArgs e)
        {
            conn.ElemanSil(Convert.ToInt32(textBox6.Tag));
            conn.SaveChanges();
            dataGridView1.DataSource = conn.ElemanListele().ToList();
            ElemanTemizleBox();
            //Eleman Silme
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //Eleman Guncelleme
            conn.ElemanYenile(Convert.ToInt32(textBox6.Tag), textBox6.Text, textBox7.Text, Convert.ToDecimal(textBox8.Text), textBox9.Text, Convert.ToInt32(textBox10.Text));
            conn.SaveChanges();
            dataGridView1.DataSource = conn.ElemanListele().ToList();
            ElemanTemizleBox();
        }
        void GorevTemizleBox()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }
        void ElemanTemizleBox()
        {
            textBox6.Clear();
            textBox7.Clear();
            textBox8.Clear();
            textBox9.Clear();
            textBox10.Clear();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
          DataGridViewRow row=  dataGridView1.CurrentRow;
            if (selectedGroup == 0)
            {
                GorevTemizleBox();
                textBox1.Tag = row.Cells[0].Value.ToString();
                textBox1.Text = row.Cells[1].Value.ToString();
                textBox2.Text = row.Cells[2].Value.ToString();
                textBox3.Text = row.Cells[3].Value.ToString();
                textBox4.Text = row.Cells[4].Value.ToString();
                textBox5.Text = row.Cells[5].Value.ToString();
            }
            else if (selectedGroup == 1)
            {
                ElemanTemizleBox();
                textBox6.Tag = row.Cells[0].Value.ToString();
                textBox6.Text = row.Cells[1].Value.ToString();
                textBox7.Text = row.Cells[2].Value.ToString();
                textBox8.Text = row.Cells[3].Value.ToString();
                textBox9.Text = row.Cells[4].Value.ToString();
                textBox10.Text = row.Cells[5].Value.ToString();
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e) { GorevListele(); textBox11.Clear(); radioButton2.Checked = false; }
        void GorevListele()
        {
            selectedGroup = 0;
            dataGridView1.Visible = true;
            dataGridView1.DataSource = conn.GorevListele().ToList();
        }
        void ElemanListele()
        {
            selectedGroup = 1;
            dataGridView1.Visible = true;
            dataGridView1.DataSource = conn.ElemanListele().ToList();
        }
        private void radioButton2_CheckedChanged(object sender, EventArgs e) { ElemanListele(); textBox11.Clear();}

        private void button7_Click(object sender, EventArgs e)
        {
            //Arama Kısmı
            if (radioButton1.Checked == true)
            {
              dataGridView1.DataSource=  conn.GorevArama(textBox11.Text).ToList();
            }
            else if (radioButton2.Checked == true)
            {
                dataGridView1.DataSource = conn.ElemanArama(textBox11.Text).ToList();
            }
            else if (radioButton2.Checked == false && radioButton1.Checked == false)
            {
                MessageBox.Show("Tablo Seçiniz");
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            //join 
            selectedGroup = 2;
            dataGridView1.DataSource = conn.GorevElemanBirleştirme().ToList();
        }

        private void button9_Click(object sender, EventArgs e) => GorevListele();
            //Görevler Listele
  
        private void button10_Click(object sender, EventArgs e) => ElemanListele();


        //Eleman listele


    }
}
